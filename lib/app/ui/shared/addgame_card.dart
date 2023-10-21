import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/models/game.dart';

// ignore: must_be_immutable
class AddGameCard extends StatefulWidget {
  AddGameCard(this.game, {super.key});

  final Game game;

  @override
  State<AddGameCard> createState() => _AddGameCardState();
}

class _AddGameCardState extends State<AddGameCard> {
  String dropdownvalue = 'Local';

  var items = [
    'Local',
    'QUADRA 01',
    'MULTIMÍDIA 14',
    '2ºANDAR',
  ];

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    
    return Card(
       clipBehavior: Clip.antiAliasWithSaveLayer,
       color: Theme.of(context).colorScheme.primaryContainer,
       elevation: 10,
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
       ),
       child: Container(
         width: sizeWidth / 1.2,
         height: 280,
         decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
         ),
         child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.game.modalidade,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: sizeWidth / 1.5,
                child: Divider(
                  height: 5,
                  thickness: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.game.team1.image,
                        width: sizeWidth / 6,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: sizeWidth / 4.8,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "VS",
                            style: TextStyle(
                             fontFamily: 'Lato',
                             fontSize: 24,
                             fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                     ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.game.team2.image,
                        width: sizeWidth / 6,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.game.team1.name,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle_sharp,
                          color: Colors.orange,
                          size: 20,
                        ),
                        Text(
                          "A ser confirmado",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.game.team2.name,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: sizeWidth / 1.5,
                child: Divider(
                  height: 5,
                  thickness: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SELECIONAR O HORÁRIO:",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Container(
                      width: sizeWidth / 4.8,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "01:00",
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SELECIONAR O LOCAL: ",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      Container(
                        width: sizeWidth / 2.8,
                        child: DropdownButton(
                                  dropdownColor: Theme.of(context).colorScheme.primaryContainer,
                                  hint: Text("Seleciona a sala"),
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                                    fontFamily: 'Lato',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                      width: sizeWidth / 1.8,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "CONFIRMAR",
                            style: TextStyle(
                             fontFamily: 'Lato',
                             fontSize: 24,
                             fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ],
          ),
         ),
       ),
    );
  }
}