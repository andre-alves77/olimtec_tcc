import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/custom_text_field.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';

import 'package:olimtec_tcc/app/features/auth/lading.store.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SignInForState();
}

class SignInForState extends ConsumerState<SignInForm> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final authNoti = ref.watch(formUserSignInProvider);

    return Form(

      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: CustomTextField(
                    hintText: 'Email',
                    onChanged: (email) => authNoti.mail = email,
                    errorMessage: authNoti.mailError,
                  )),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: CustomTextField(
                  errorMessage: authNoti.passError,
                  hintText: 'Senha',
                  onChanged: (password) => authNoti.pass = password,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: SizedBox(
                  width: sizeWidth / 2,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: const Color(0xFFEDEDED),
                    ),
                    child: const FittedBox(
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {
                      ref.read(formUserSignInProvider.notifier).submitIn();
                    },
                  ),
                ),
              ),
              TextButton(
                child: const FittedBox(
                  child: Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      color: Color(0xFFEDEDED),
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
