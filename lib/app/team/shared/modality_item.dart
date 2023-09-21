import 'dart:math';

import 'package:flutter/material.dart';

class ModalityItem extends StatelessWidget {
  const ModalityItem(this.icone, this.name, {super.key});

  final IconData icone;
  final String name;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return AspectRatio(
      aspectRatio: 4.5,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Theme.of(context).colorScheme.primary,
          child: FittedBox(
            alignment: Alignment.centerLeft,
            child: Container(
              width: sizeWidth,
              child: ListTile(
                leading: Icon(
                  icone,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: sizeWidth / 9,
                ),
                title: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    name,
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
            context, '/team_player'
          );
        },
      ),
    );
  }
}