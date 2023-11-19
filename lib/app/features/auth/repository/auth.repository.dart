import 'dart:convert';
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/providers/firebase.provider.dart';
import 'package:olimtec_tcc/app/core/providers/navigatorkey.dart';

import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/models/user.model.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';

class AuthRepository extends ChangeNotifier {
   AuthRepository({required this.auth, required this.ref});

  final FirebaseAuth auth;
  final Ref ref;
  static AppUser? user;

  Stream<User?> get authStateChange => auth.authStateChanges();

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final firebasestore = ref.read(firebaseFirestoreProvider);
      final result = await auth.signInWithEmailAndPassword(
        email: 'luansoares@etec.sp.gov.br',
        password: 'A1234567',
      );

        final userMap = await firebasestore.collection('users').where("id", isEqualTo: auth.currentUser!.uid).get();

Map users = {};
for(var x in userMap.docs){
users[x.id] = x.data();
}
users.forEach((key, value){
ref.read(appUserProvider.notifier).state = AppUser.fromMap(value);
        

});
notifyListeners();
      

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
try{

  await auth.createUserWithEmailAndPassword(email: email, password: password);
      final firebasestore = ref.read(firebaseFirestoreProvider);

  await firebasestore.collection('users').add({    
'avatar': '',
'id': auth.currentUser?.uid,
"isAdmin": false,
"isLeader": false,
'isOrganization' : false,
'name':name,
'teamName':'3DSB',
  });

final userMap = await firebasestore.collection('users').where("id", isEqualTo: auth.currentUser!.uid).get();

Map users = {};
for(var x in userMap.docs){
users[x.id] = x.data();
}
users.forEach((key, value){
ref.read(appUserProvider.notifier).state = AppUser.fromMap(value);
});


}on FirebaseAuthException catch (e){
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
