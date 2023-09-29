import 'dart:math';

import 'package:flutter/material.dart';

class OrganizationAddModality extends StatefulWidget {
  const OrganizationAddModality({super.key});

  @override
  State<OrganizationAddModality> createState() => _OrganizationAddModalityState();
}

class _OrganizationAddModalityState extends State<OrganizationAddModality> {

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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: sizeWidth / 2.4,
                        height: 50,
                        child: DropdownButton(
                          dropdownColor: Theme.of(context).colorScheme.onSecondaryContainer,
                          hint: Text("Seleciona a sala"),
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}