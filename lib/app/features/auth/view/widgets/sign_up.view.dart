import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/custom_text_field.dart';
import 'package:olimtec_tcc/app/features/auth/lading.store.dart';
import 'package:provider/provider.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final aiuth = ref.watch(formUserSignInProvider);
    return Form(

      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: CustomTextField(
                  errorMessage: aiuth.nameError,
                  hintText: 'Nome',
                  onChanged: (value) => aiuth.name = value,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: CustomTextField(
                    errorMessage: aiuth.emailError,
                    hintText: 'Email',
                    onChanged: (value) => aiuth.email = value),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: CustomTextField(
                  errorMessage: aiuth.passwordError,
                  hintText: 'Senha',
                  onChanged: (value) => aiuth.password = value,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: CustomTextField(
                  errorMessage: aiuth.password2Error,
                  hintText: 'Confirmar senha',
                  onChanged: (value) => aiuth.password2 = value,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
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
                        "Criar Conta",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {
                      ref.read(formUserSignInProvider.notifier).submitUp();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
