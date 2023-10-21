import 'dart:math';

import 'package:flutter/material.dart';

class AddModalityAdmin extends StatefulWidget {
  const AddModalityAdmin({super.key});

  static String route = "/addmodality-admin";

  @override
  State<AddModalityAdmin> createState() => _AddModalityAdminState();
}

class _AddModalityAdminState extends State<AddModalityAdmin> {
  String dropdownvalue1 = 'Selecione a categoria';

  var items1 = [
    'Selecione a categoria',
    'Esportes de Quadra',
    'Jogos de Mesa',
    'Jogos Fora de Quadra',
    'Jogos Eletrônicos',
    'Danças'
  ];

  String dropdownvalue2 = 'Selecione o tipo de placar';

  var items2 = [
    'Selecione o tipo de placar',
    'Placar de números 1 a 100',
    'Placar de vencedor direto'
  ];

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DEFINIR MODALIDADES",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Center(
          child: FittedBox(
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Theme.of(context).colorScheme.primaryContainer,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                width: sizeWidth / 1.1,
                height: 352,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            size: 48,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ADICIONAR ÍCONE",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "DA NOVA MODALIDADE",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: sizeWidth / 1.3,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer, //background color of dropdown button
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: sizeWidth / 1.5,
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
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    value: dropdownvalue1,
                                    items: items1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items as String),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue1 = newValue!;
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
                        width: sizeWidth / 1.3,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer, //background color of dropdown button
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: sizeWidth / 1.5,
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
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    value: dropdownvalue2,
                                    items: items2.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items as String),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue2 = newValue!;
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
                        width: sizeWidth / 1.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Digite o nome da modalidade",
                            labelStyle: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: SizedBox(
                        width: sizeWidth / 1.8,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor: const Color(0xFFEDEDED),
                          ),
                          child: FittedBox(
                            child: Text(
                              "ADICIONAR",
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
