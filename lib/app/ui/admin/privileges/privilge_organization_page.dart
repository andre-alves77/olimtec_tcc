import 'dart:math';

import 'package:flutter/material.dart';

class PrivilegeOrganizationPage extends StatefulWidget {
  const PrivilegeOrganizationPage({super.key});

  @override
  State<PrivilegeOrganizationPage> createState() => _PrivilegeOrganizationPageState();
}

class _PrivilegeOrganizationPageState extends State<PrivilegeOrganizationPage> {
  
  _ModalityCard() {

    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return AspectRatio(
      aspectRatio: 4.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer
        ),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          child: Container(
            width: sizeWidth,
            child: ListTile(
              leading: Icon(
                Icons.sports_basketball,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: sizeWidth / 9,
              ),
              title: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Text(
                  "BASQUETE MASCULINO",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 24,
                  ),
                ),
              ),
              trailing: Icon(
                Icons.remove,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ),
      ),
    );

  }

  _CardJogador2() {

  final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            'assets/images/LOGO_USUARIO.png',
            fit: BoxFit.cover,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            width: sizeWidth / 2.8,
              child: FittedBox(
                child: const Text(
                  'Fulano de tal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        trailing: Container(
          width: sizeWidth / 7.8,
          child: FittedBox(
            child: Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final sizeHeight = min(MediaQuery.of(context).size.height, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ORGANIZADORES - 2ºDSB",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/LOGO_2DSB_EXAMPLE.png",
                        width: sizeWidth / 2,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: sizeWidth / 4.2,
                            child: const FittedBox(
                              child: Text(
                                "2DSB",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth / 1.2,
                            child: Divider(
                              thickness: 2,
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: sizeWidth / 1.5,
                                    child: const FittedBox(
                                      child: Text(
                                        "RESPONSÁVEIS PELAS ",
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: sizeWidth / 1.9,
                                    child: FittedBox(
                                      child: Text(
                                        "MODALIDADES",
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Theme.of(context).colorScheme.primary,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: sizeWidth / 1.2,
                      height: sizeHeight * 0.45,
                      child: ListView(
                        children: [
                          _ModalityCard(),
                          Padding(padding: EdgeInsets.all(8)),
                          _ModalityCard(),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: sizeWidth / 1.2,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Text(
                              "ALUNOS",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "INSIRA OS REPRESENTANTES ABAIXO",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: sizeWidth / 1.1,
                          height: sizeHeight * 0.6,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                              width: 2,
                            ),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                      Divider(
                          height: 2,
                          thickness: 1.5,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      _CardJogador2(),
                      Divider(
                          height: 2,
                          thickness: 1.5,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      _CardJogador2(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}