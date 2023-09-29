// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/auth/providers/auth_provider.dart';

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

  void submit() async {
    toggleLoading();
    toggleLoading();
  }

  submitIn() {
    ref
        .read(authNotifierProvider.notifier)
        .login(email: email, password: password);
  }

  submitUp() {
    debugPrint(email);
    debugPrint(password);
    ref
        .read(authNotifierProvider.notifier)
        .signup(email: email, password: password);
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