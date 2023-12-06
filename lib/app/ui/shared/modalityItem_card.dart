import 'package:flutter/material.dart';
import 'dart:math';

import 'package:olimtec_tcc/app/models/modality/modality.dart';

class ModalityItemCard extends StatelessWidget {
  const ModalityItemCard({this.routesArg, required this.routes, required this.modalityName, required this.iconName, super.key});

  final String routes;
  final String modalityName;
  final Map<String, dynamic> iconName;
  final String? routesArg;
  
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return AspectRatio(
      aspectRatio: 4.5,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          surfaceTintColor: Theme.of(context).colorScheme.primaryContainer,
          child: FittedBox(
            alignment: Alignment.centerLeft,
            child: Container(
              width: sizeWidth,
              child: ListTile(
                leading: Icon(
                 IconData(iconName['codePoint'],fontFamily: iconName['fontFamily']),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: sizeWidth / 9,
                ),
                title: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    modalityName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
         onTap: () {
          Navigator.pushNamed(
            context, routes, arguments: routesArg,
          );
        },
      ),
    );
  }
}
