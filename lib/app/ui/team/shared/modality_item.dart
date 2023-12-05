import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/features/admin/privileges/leader/view/team_players.dart';

class ModalityItem extends StatelessWidget {
  const ModalityItem({super.key, required this.routes, required this.modalityName, required this.iconName, required this.routesArg});

  final String routes;
  final String modalityName;
  final String iconName;
  final String routesArg;
  

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;
    return AspectRatio(
      aspectRatio: 4.5,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Theme.of(context).colorScheme.primary,
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
          Navigator.pushNamed(context, routes, arguments: routesArg);
        },
      ),
    );
  }
}
