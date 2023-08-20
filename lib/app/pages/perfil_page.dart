import 'dart:math';

import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          "MEU PERFIL",
          style: TextStyle(
            fontFamily: 'Lato',
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset(
                      'assets/images/LOGO_USUARIO.png',
                      width: sizeWidth / 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: sizeWidth / 2.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {},
                        child: const FittedBox(
                          child: Text(
                            "Alterar Foto",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: sizeWidth / 2.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                        onPressed: () {},
                        child: const FittedBox(
                          child: Text(
                            "Remover Foto",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: sizeWidth / 5.2,
                                child: const FittedBox(
                                  child: Text(
                                    'NOME:',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize:20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: Container(
                                  width: sizeWidth / 2,
                                  child: TextFormField(
                                    autofocus: true,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        fontSize: 16,
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        fontSize: 16,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).colorScheme.primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).colorScheme.secondary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      contentPadding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: sizeWidth / 5.2,
                                child: const FittedBox(
                                  child: Text(
                                    '       RM:',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize:20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: Container(
                                  width: sizeWidth / 2,
                                  child: TextFormField(
                                    autofocus: true,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        fontSize: 16,
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        fontSize: 16,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).colorScheme.primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).colorScheme.secondary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      contentPadding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: sizeWidth / 5.2,
                                child: const FittedBox(
                                  child: Text(
                                    'EMAIL:',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize:20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: Container(
                                  width: sizeWidth / 2,
                                  child: TextFormField(
                                    autofocus: true,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        fontSize: 16,
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        fontSize: 16,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).colorScheme.primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).colorScheme.secondary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      contentPadding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}