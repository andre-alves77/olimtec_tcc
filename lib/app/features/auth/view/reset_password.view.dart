import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/custom_text_field.dart';
import 'package:olimtec_tcc/app/features/auth/lading.store.dart';
import 'package:olimtec_tcc/app/features/auth/repository/auth.repository.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/features/auth/view/landing_page.view.dart';

class ResetPasswordForm extends ConsumerStatefulWidget {
  const ResetPasswordForm({super.key});

  static String route = "/resetpassword";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ResetPasswordFormState();
}

class ResetPasswordFormState extends ConsumerState<ResetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    String email = "";
    var size = MediaQuery.of(context).size;
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              'assets/images/trio_absurdo_login.jpg',
            ).image,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0x990F1113),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_principal_dark_mode.png',
                  width: sizeWidth / 1.5,
                  height: 155,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: sizeWidth / 2,
                  child: FittedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "OLIM",
                          style: TextStyle(
                            color: Color(0xFFEDEDED),
                            fontFamily: 'Lato',
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "TEC",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: 'Lato',
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: SizedBox(
                    width: sizeWidth / 1.2,
                    child: const FittedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "SINTA A EXPERIÊNCIA OLÍMPICA",
                            style: TextStyle(
                              color: Color(0xFFEDEDED),
                              fontFamily: 'Lato',
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: SizedBox(
                    width: sizeWidth / 1.2,
                    child: const FittedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Insira abaixo o email para recuperar a senha",
                            style: TextStyle(
                              color: Color(0xFFEDEDED),
                              fontFamily: 'Lato',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: SizedBox(
                    width: sizeWidth / 1.9,
                    child: const FittedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Pode demorar um pouquinho",
                            style: TextStyle(
                              color: Color(0xFFEDEDED),
                              fontFamily: 'Lato',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: CustomTextField(
                                hintText: 'Email',
                                onChanged: (String value) {
                                  email = value;
                                },
                              )),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 24, 0, 0),
                            child: SizedBox(
                              width: sizeWidth / 2,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  foregroundColor: const Color(0xFFEDEDED),
                                ),
                                child: const FittedBox(
                                  child: Text(
                                    "Enviar",
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  ref
                                      .read(authRepositoryProvider)
                                      .sendPasswordResetEmail(email);
                                },
                              ),
                            ),
                          ),
                          TextButton(
                            child: const FittedBox(
                              child: Text(
                                "Voltar para o login",
                                style: TextStyle(
                                  color: Color(0xFFEDEDED),
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, LandingPage.route);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
