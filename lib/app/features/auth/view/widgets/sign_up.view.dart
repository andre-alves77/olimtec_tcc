import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      key: aiuth.formAuthKeySignUp,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: TextFormField(
                  onChanged: (value) => aiuth.name = value,
                  decoration: InputDecoration(
                    hintText: 'Nome',
                    labelStyle: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color(0xFF414141),
                      fontSize: 18,
                    ),
                    hintStyle: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color(0xFF414141),
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                  ),
                  style: TextStyle(
                    fontFamily: "Lato",
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: TextFormField(
                  onChanged: (value) {
                    aiuth.email = value.trim();
                  },
                  validator: (val) {
                    String value = val ?? "";
                    if (!value.trim().contains("@etec.sp.gov.br")) {
                      return "Email inválido, insira seu email institucional";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Email da Etec',
                    labelStyle: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color(0xFF414141),
                      fontSize: 18,
                    ),
                    hintStyle: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color(0xFF414141),
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                  ),
                  style: TextStyle(
                    fontFamily: "Lato",
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: TextFormField(
                    onChanged: (value) => aiuth.password = value.trim(),
                    validator: (val) {
                      String value = val ?? "";
                      if (value.length < 8) {
                        return "A senha deve conter 8 caracteres no mínimo";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      labelStyle: const TextStyle(
                        fontFamily: 'Lato',
                        color: Color(0xFF414141),
                        fontSize: 18,
                      ),
                      hintStyle: const TextStyle(
                        fontFamily: 'Lato',
                        color: Color(0xFF414141),
                        fontSize: 14,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                      suffixIcon: Icon(Icons.visibility_off),
                    )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: TextFormField(
                  validator: (value) {
                    final val = value ?? false;
                    if (val != aiuth.password) {
                      return "Senhas incompátiveis";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirmar senha',
                    labelStyle: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color(0xFF414141),
                      fontSize: 18,
                    ),
                    hintStyle: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color(0xFF414141),
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  focusNode: FocusNode(skipTraversal: true),
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
