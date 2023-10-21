// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final formUserSignInProvider =
    ChangeNotifierProvider.autoDispose<FormSignInStore>((ref) {
  return FormSignInStore(ref);
});

enum FormUserState { SignUp, SignIn }

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

  String pass = "";
  String mail = "";
  String passError = "";
  String mailError = "";

  FormUserState mode = FormUserState.SignIn;
  final formAuthKeySignIn = GlobalKey<FormState>();
  final formAuthKeySignUp = GlobalKey<FormState>();
  bool _isLoading = false;

  FormSignInStore(this.ref);

  void toggleLoading() {
    _isLoading == true ? _isLoading = false : _isLoading = true;
    notifyListeners();
  }

  bool get isLoading {
    return _isLoading;
  }

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
    }
  }

  submitUp() {
    emailError = "";
    passwordError = "";
    password2Error = "";
    nameError = "";

    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
      nameError += "Insira somente letras.\n";
    }
    if (!RegExp(r'^\w+\s+\w+$').hasMatch(name)) {
      nameError += "Insira no máximo duas palavras";
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

    if (password != password2) {
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

    notifyListeners();

    if (emailError.isEmpty && passwordError.isEmpty) {
      //signup
    }
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