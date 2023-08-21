import 'dart:math';

import 'package:flutter/material.dart';

class LoginTabBarView extends StatefulWidget {
  const LoginTabBarView({super.key});

  @override
  State<LoginTabBarView> createState() => _LoginTabBarViewState();
}

class _LoginTabBarViewState extends State<LoginTabBarView> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return  Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      44, 0, 44, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 20, 0, 0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: 'RM',
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
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                      20, 24, 20, 24),
                                            ),
                                            style: TextStyle(
                                              fontFamily: "Lato",
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 12, 0, 0),
                                          child: TextFormField(
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide:
                                                      const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                        20, 24, 20, 24),
                                                suffixIcon: IconButton(
                                                  icon: Icon(Icons.visibility_off),
                                                  onPressed: () {
                                                    setState(() {
                                                    });
                                                  },
                                                ),
                                              ),
                                              focusNode: FocusNode(skipTraversal: true),
                                            style: TextStyle(
                                              fontFamily: "Lato",
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 0),
                                          child: SizedBox(
                                            width: sizeWidth / 2,
                                            height: 50,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 5,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                foregroundColor:
                                                    const Color(0xFFEDEDED),
                                              ),
                                              child: const FittedBox(
                                                child: Text(
                                                  "Entrar",
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {},
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
                                );
                                
  }
}