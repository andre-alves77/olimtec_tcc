// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/features/championship/models/team.dart';

final formUserSignInProvider = ChangeNotifierProvider<FormSignInStore>((ref) {
  return FormSignInStore(ref);
});

enum FormUserState { SignUp, SignIn }



final teamnamesstream = StreamProvider.autoDispose((ref) {
 return FirebaseFirestore.instance
     .collection('team')
     .snapshots()
     .map((querySnapshot) => querySnapshot.docs.map((doc) => doc['name']).toList());

});



final getTeamStringProvider = FutureProvider((ref) async {
  try {
    Future<List<String>> getTeams() async {
      List<String> fieldValues = [];

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("team").get();
      for (var doc in querySnapshot.docs) {
        fieldValues.add(doc["name"]);
      }
      return fieldValues;
    }

    return getTeams();
  } catch (e) {
    print(e.toString());
  }
});

class FormSignInStore extends ChangeNotifier {
  final Ref ref;
  String name = "";
  String email = "";
  String password = "";
  String password2 = "";
  String nameError = "";
  String emailError = "";
  String password2Error = "";
  String passwordError = "";
  String team = "";
  String teamError = "";

  String pass = "";
  String mail = "";
  String passError = "";
  String mailError = "";

  FormUserState mode = FormUserState.SignIn;
  final formAuthKeySignIn = GlobalKey<FormState>();
  final formAuthKeySignUp = GlobalKey<FormState>();
  bool isLoading = false;
  List<String> teams = [];

  turnOffLoading() {
    isLoading = false;
    notifyListeners();
  }

  FormSignInStore(this.ref);

  submitIn() {
    passError = "";
    mailError = "";
    if (pass.isEmpty) {
      passError = "Insira a senha";
    }
    if (mail.isEmpty &&
        !RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(mail)) {
      mailError = "Insira um email válido";
    }
    notifyListeners();
    if (passError.isEmpty && mailError.isEmpty) {
      //login

      isLoading = true;
      ref.read(authRepositoryProvider).signInWithEmailAndPassword(mail, pass);
      notifyListeners();
    }
  }

  submitUp() async {
    emailError = "";
    passwordError = "";
    password2Error = "";
    nameError = "";
    teamError = "";

    if (team.isEmpty) {
      teamError = "Preencha o campo de time";
      CustomSnackBar(
          message: "Preencha o campo de time",
          ref: ref,
          type: ScaffoldAlert.error) as String;
    }

    if (name.split(' ').length > 2 && !RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
      nameError += "Insira somente letras e no máximo duas palavras.\n";
    }

    if (password.length < 8) {
      passwordError += "8 caracteres.";
    }

    // Verifica se há pelo menos uma letra maiúscula.
    if (!password.contains(RegExp(r'[A-Z]'))) {
      passwordError += " Uma letra maiúscula.";
    }

    // Verifica se há pelo menos um número.
    if (!password.contains(RegExp(r'[0-9]'))) {
      passwordError += " Um número.";
    }

    if (password.toString() != password2.toString()) {
      password2Error += " As senhas estão diferentes";
    }

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
      emailError += "Insira um email válido. ";
    }
    if (!email.contains("@etec.sp.gov.br")) {
      emailError += "Use seu email institucional da ETEC";
    }

    if (passwordError.isNotEmpty) {
      passwordError = "Deve haver pelo menos:\n" + passwordError;
    }

    if (nameError.isEmpty &&
        emailError.isEmpty &&
        passwordError.isEmpty &&
        password2Error.isEmpty &&
        teamError.isEmpty) {
      //signup
      isLoading = true;
      ref.read(authRepositoryProvider).createUser(email, password, name, team);
    }

    CustomSnackBar(
        message: "email: $email, senha: $password, nome: $name", ref: ref);
    notifyListeners();
  }

  setTeam(String value) {
    team = value;
    notifyListeners();
  }
}




  


/* class FormSignInStore extends ChangeNotifier {
  String name = "";
  String email = "";
  String password = "";
  FormUserState mode = FormUserState.SignIn;
  final formAuthKeySignIn = GlobalKey<FormState>();
  final formAuthKeySignUp = GlobalKey<FormState>();
  bool _isLoading = false;

  void toggleLoading() {
    _isLoading == true ? _isLoading = false : _isLoading = true;
    notifyListeners();
  }

  bool get isLoading {
    return _isLoading;
  }

  void submit() async {
    formAuthKeySignIn.currentState?.validate();
    formAuthKeySignUp.currentState?.validate();

    toggleLoading();
    await Future.delayed(const Duration(seconds: 2));
    toggleLoading();
  }
}
 */