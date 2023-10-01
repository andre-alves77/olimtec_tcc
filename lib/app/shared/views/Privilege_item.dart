import 'dart:math';

import 'package:flutter/material.dart';

class PrivilegeOption extends StatelessWidget {
  const PrivilegeOption(this.icone, this.name, this.route, {super.key});

  final IconData icone;
  final String name;
  final String route;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return AspectRatio(
      aspectRatio: 3.2,
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
                  size: sizeWidth / 7,
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
            context, route,
          );
        },
      ),
    );
  }
}