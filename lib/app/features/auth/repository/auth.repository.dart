import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/providers/firebase.provider.dart';
import 'package:olimtec_tcc/app/core/providers/navigatorkey.dart';

import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';

class AuthRepository {
  const AuthRepository(this._auth, this.ref);

  final FirebaseAuth _auth;
  final Ref ref;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      CustomSnackBar(message: 'Login efetuado', ref: ref);

      return result.user;
    } on FirebaseAuthException catch (e) {
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

  Future<User?> createUser(String email, String password, String name) async {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
      ref.read(firebaseFirestoreProvider).collection('users').add({
        'avatar': '',
        'email': email,
        'name': name,
        'teamName': '3DSB',
      });
    } on FirebaseAuthException catch (e) {
      throw AuthException.snackbar(e.message.toString(), ref);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
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
