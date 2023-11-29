import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/providers/firebase.provider.dart';
import 'package:olimtec_tcc/app/core/providers/navigatorkey.dart';

import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/lading.store.dart';
import 'package:olimtec_tcc/app/features/auth/models/user.model.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';

class AuthRepository extends ChangeNotifier {
  AuthRepository({required this.auth, required this.ref});

  final FirebaseAuth auth;
  final Ref ref;
  static AppUser? user;

  Stream<User?> get authStateChange => auth.authStateChanges();

  Stream<AppUser> streamUserdata() async* {
    if (auth.currentUser != null) {
// ignore: unused_local_variable
      dynamic documentId;
      var value = await FirebaseFirestore.instance
          .collection('users')
          .where("id", isEqualTo: auth.currentUser!.uid);

      yield* value.snapshots().map((snap) {
        if (snap.docChanges.isNotEmpty) {
          var y = snap.docs.first.data();
          return AppUser.fromMap(y);
        } else {
          throw CustomSnackBar(
              ref: ref, message: 'Um erro aconteceu. Tente novamente.',type: ScaffoldAlert.error);
        }
      });
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final firebasestore = ref.read(firebaseFirestoreProvider);
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      /*final userMap = await firebasestore
          .collection('users')
          .where("id", isEqualTo: auth.currentUser!.uid)
          .get();
        */

        


          Future.delayed(const Duration(seconds: 2), (){
          ref.read(formUserSignInProvider.notifier).turnOffLoading();
          });
notifyListeners();
      

      CustomSnackBar(message: 'Login efetuado', ref: ref);

      return result.user;
    } on FirebaseAuthException catch (e) {
           ref.read(formUserSignInProvider.notifier).turnOffLoading();
      if (e.code == 'user-not-found') {
        throw AuthException.snackbar('Senha e/ou email incorretos.', ref);
      } else if (e.code == 'invalid-login-credentials') {
        throw AuthException.snackbar('Senha e/ou email incorretos.', ref);
      } else if (e.code == 'user-disabled') {
        throw AuthException.snackbar('Usuário desativado.', ref);
      } else if (e.code == 'invalid-email') {
        throw AuthException.snackbar('Email inválido.', ref);
      } else if (e.code == 'too-many-requests') {
        throw AuthException.snackbar(
            'Muitas tentativas. Tente novamente mais tarde.', ref);
      } else {
        throw AuthException.snackbar(
            'Ops, um erro aconteceu. Tente novamente.', ref);
      }
    }
  }

  Future<User?> createUser(String email, String password, String name, String team) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final firebasestore = ref.read(firebaseFirestoreProvider);

      await firebasestore.collection('users').add({
        'avatar': '',
        'id': auth.currentUser?.uid,
        "isAdmin": false,
        "isLeader": false,
        'isOrganization': false,
        'name': name,
        'teamName': team,
      });
      signInWithEmailAndPassword(email, password);

          Future.delayed(const Duration(seconds: 2), (){
          ref.read(formUserSignInProvider.notifier).turnOffLoading();
          });
}on FirebaseAuthException catch (e){
             ref.read(formUserSignInProvider.notifier).turnOffLoading();
  throw AuthException.snackbar(e.message.toString(), ref);
}
return null;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
  AuthException.snackbar(this.message, Ref ref) : super() {
    final scaffoldMessenger = ref.read(scaffoldMessengerPod);

    scaffoldMessenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  String toString() {
    return message;
  }
}
