import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/IconPicker/icons.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/initial_config.store.dart';
import 'package:olimtec_tcc/app/features/championship/views/initial_config/add_locals.dart';

class AddModalityAdmin extends ConsumerStatefulWidget {
  const AddModalityAdmin({super.key});

  static String route = "/addmodality-admin";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddModalityAdminState();
}

class _AddModalityAdminState extends ConsumerState<AddModalityAdmin> {
  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.material]);
    ref
        .read(initialConfigProvider)
        .setIcon(icon ?? Icons.sports_gymnastics_outlined);
    setState(() {});
    debugPrint('Picked Icon: $icon');
  }

  String modalityName = "";

  String dropdownvalue1 = 'Selecione a categoria';

  var items1 = [
    'Selecione a categoria',
    'quadra',
    'jogos de mesa',
    'e-sports',
    'dança',
    'outros',
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
    final modalitiesList = ref.watch(initialConfigProvider).modalitiesList;

    List<Widget> modalitiesWidgets = [];
    modalitiesList.forEach((element) {
      modalitiesWidgets.add(
        Row(
          children: [
            FittedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(IconData(element.icon['codePoint'],
                          fontFamily: element.icon['fontFamily'])),
                      Text("${element.name.toUpperCase()}"),
                    ],
                  ),
                  Text("   Categoria: ${element.category}"),
                  Text("   Placar: ${element.scoreType}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: IconButton(
                  onPressed: () {
                    ref
                        .read(initialConfigProvider)
                        .removeModality(element.name);
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.red,
                  )),
            )
          ],
        ),
      );
    });

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
        child: SingleChildScrollView(
          child: Form(
            child: Center(
              child: Column(
                children: [
                  FittedBox(
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        width: sizeWidth / 1.1,
                        height: 460,
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
                                  onPressed: () {
                                    _pickIcon();
                                  },
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  shape: CircleBorder(),
                                  child: Icon(
                                    ref.read(initialConfigProvider).icon ??
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: sizeWidth / 1.3,
                                child: TextFormField(
                                  autofocus: true,
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 3,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 3,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  onChanged: (value) {
                                    modalityName = value;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: sizeWidth / 1.3,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer, //background color of dropdown button
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 3), //border of dropdown button
                                      borderRadius: BorderRadius.circular(
                                          50), //border raiuds of dropdown button
                                      boxShadow: <BoxShadow>[
                                        //apply shadow on Dropdown button
                                        BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0,
                                                0.57), //shadow for button
                                            blurRadius:
                                                5) //blur radius of shadow
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: sizeWidth / 1.5,
                                          height: 50,
                                          child:
                                              DropdownButtonFormField<String>(
                                            autofocus: false,
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
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            value: dropdownvalue1,
                                            items: items1.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items as String),
                                              );
                                            }).toList(),
                                            onChanged: (String? nemValue) {
                                              setState(() {
                                                dropdownvalue1 = nemValue!;
                                              });
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value ==
                                                      "Selecione a categoria") {
                                                return 'Campo Obrigatório';
                                              }
                                              return null;
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: sizeWidth / 1.3,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer, //background color of dropdown button
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 3), //border of dropdown button
                                      borderRadius: BorderRadius.circular(
                                          50), //border raiuds of dropdown button
                                      boxShadow: <BoxShadow>[
                                        //apply shadow on Dropdown button
                                        BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0,
                                                0.57), //shadow for button
                                            blurRadius:
                                                5) //blur radius of shadow
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: sizeWidth / 1.5,
                                          height: 50,
                                          child:
                                              DropdownButtonFormField<String>(
                                            autofocus: false,
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
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            value: dropdownvalue2,
                                            items: items2.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: (String? nemValue) {
                                              setState(() {
                                                dropdownvalue2 = nemValue!;
                                              });
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value ==
                                                      "Selecione o tipo de placar") {
                                                return 'Campo Obrigatório';
                                              }
                                              return null;
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: SizedBox(
                                width: sizeWidth / 1.8,
                                height: 40,
                                child: ElevatedButton(
                                  autofocus: true,
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
                                  onPressed: () {
                                    ref.read(initialConfigProvider).addModality(
                                        modalityName,
                                        dropdownvalue1,
                                        dropdownvalue2);
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 170,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'CONFIRMAR',
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ...modalitiesWidgets,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
