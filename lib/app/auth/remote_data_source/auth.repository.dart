// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:olimtec_tcc/app/core/providers/firebase.provider.dart';

class AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final Ref _ref; // use for reading other providers

  AuthDataSource(this._firebaseAuth, this._ref);

  Future<Either<String, User>> signup(
      {required String email, required String password}) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(response.user!);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to Signup.');
    }
  }

  Future<Either<String, User>> login(
      {required String email, required String password}) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(response.user!);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to Login.');
    }
  }

  signout() {
    _firebaseAuth.signOut();
  }
}

/* 
  if (e.code == 'user-not-found') {
  left("Senha ou email incorretos. Tente novamnte");
  } else if (e.code == 'wrong-password') {
  left('Senha ou email incorretos. Tente novamente');
  }else if(e.code == "invalid-email:"){
left('Email inválido');
  }else if(e.code == ""){

  }
 */
/* class AuthRepository {
  AuthRepository(this.ref, this._auth);

  Ref ref;
  FirebaseAuth _auth;

  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('Nenhum usuário encontrado com esse e-mail');
      } else if (e.code == 'wrong-password') {
        throw Exception('A senha provida está errada.');
      } else {
        throw Exception('Um erro aconteceu, tente novamente mais tarde.');
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
 */
