import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
              ref: ref,
              message: 'Um erro aconteceu. Tente novamente.',
              type: ScaffoldAlert.error);
        }
      });
    }
  }


void  deleteAllUsersTeams()async {
  FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot querySnapshot) {
   querySnapshot.docs.forEach((doc) {
    if(doc.get('isAdmin') == false){
       FirebaseFirestore.instance.collection('users').doc(doc.id).update({
           'teamName': 'nenhum'
       });
    }
   });
});
}
void  deleteAllUsersPrivilliges()async {
  FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot querySnapshot) {
   querySnapshot.docs.forEach((doc) {
    if(doc.get('isAdmin') == false){
       FirebaseFirestore.instance.collection('users').doc(doc.id).update({
           'isLeader': false,
           'isOrganization':false,
       });
    }
   });
});
}

  Future<List<String>> getUserIds() async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    List<String> userIdList = [];


    try{
  final snapshot = await userCollection.get();
    snapshot.docs.map((doc) {
      if (doc.data()['isAdmin'] == null) {
      } else if (doc.data()['isAdmin'] == false) {
        userIdList.add(doc.data()['id']);
      }
    });
    }catch (e){
      print('Deu ERROR');
    }


    return userIdList;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email).then((_) {
      CustomSnackBar(message: 'Email enviado', ref: ref);
    }).catchError((error) {
      print(error);
    });
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

      Future.delayed(const Duration(seconds: 2), () {
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

  Future<User?> createUser(
      String email, String password, String name, String team) async {
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

      Future.delayed(const Duration(seconds: 2), () {
        ref.read(formUserSignInProvider.notifier).turnOffLoading();
      });
    } on FirebaseAuthException catch (e) {
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
