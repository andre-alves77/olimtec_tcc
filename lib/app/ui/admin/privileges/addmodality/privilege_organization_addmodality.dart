import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/ui/shared/modalitybutton.dart';
import 'package:olimtec_tcc/app/ui/shared/modalityselectitem.dart';

class OrganizationAddModalityAdmin extends StatefulWidget {
  const OrganizationAddModalityAdmin({super.key});

  static String route = "/privilegeorganizationaddmodality-admin";

  @override
  State<OrganizationAddModalityAdmin> createState() =>
      _OrganizationAddModalityAdminState();
}

class _OrganizationAddModalityAdminState
    extends State<OrganizationAddModalityAdmin> {
  String dropdownvalue = '2ºEAA';

  var items = [
    '2ºEAA',
    '2ºEAB',
    '2ºDSA',
    '2ºDSB',
  ];

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ATRIBUIR MODALIDADES",
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Selecione a sala e as modalidades que ",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " cada segundo ano ficará encarregado ",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: sizeWidth / 1.8,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer, //background color of dropdown button
                          border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              width: 3), //border of dropdown button
                          borderRadius: BorderRadius.circular(
                              50), //border raiuds of dropdown button
                          boxShadow: <BoxShadow>[
                            //apply shadow on Dropdown button
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: sizeWidth / 2.4,
                              height: 50,
                              child: DropdownButton(
                                dropdownColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                hint: Text("Seleciona a sala"),
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                value: dropdownvalue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items as String),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    child: SizedBox(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ModalityButton("Jogos de quadra", () {}),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 8, 0)),
                            ModalityButton("Jogos de mesa", () {}),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0)),
                            ModalityButton("Jogos fora de quadra", () {}),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0)),
                            ModalityButton("Jogos eletrônicos", () {}),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0)),
                            ModalityButton("Danças", () {}),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ModalitySelectItem(
                            icone: Icons.sports_basketball,
                            text1: "BASQUETE MASCULINO",
                            cor: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0)),
                          ModalitySelectItem(
                            icone: Icons.sports_basketball,
                            text1: "BASQUETE FEMININO",
                            cor: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0)),
                          ModalitySelectItem(
                            icone: Icons.sports_handball,
                            text1: "HANDBALL MASCULINO",
                            cor: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0)),
                          ModalitySelectItem(
                            icone: Icons.sports_handball,
                            text1: "HANDBALL MASCULINO",
                            cor: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0)),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Text(
                              "MODALIDADES SELECIONADAS",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0)),
                            ModalitySelectItem(
                              icone: Icons.sports_basketball,
                              text1: "BASQUETE MASCULINO",
                              cor: Theme.of(context).colorScheme.primary,
                            ),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0)),
                            ModalitySelectItem(
                              icone: Icons.sports_basketball,
                              text1: "BASQUETE FEMININO",
                              cor: Theme.of(context).colorScheme.primary,
                            ),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0)),
                            ModalitySelectItem(
                              icone: Icons.sports_handball,
                              text1: "HANDBALL MASCULINO",
                              cor: Theme.of(context).colorScheme.primary,
                            ),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0)),
                            ModalitySelectItem(
                              icone: Icons.sports_handball,
                              text1: "HANDBALL MASCULINO",
                              cor: Theme.of(context).colorScheme.primary,
                            ),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ModalityButton("CONFIRMAR", () {}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
