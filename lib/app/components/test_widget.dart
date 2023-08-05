import 'package:flutter/material.dart';
import 'dart:math';

class SportItemTest extends StatelessWidget {
  const SportItemTest(this.icon, this.modalidade, {super.key});

  final modalidade;
  final icon;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return AspectRatio(
      aspectRatio: 4.5,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.primaryContainer,
          width: sizeWidth,
          child: ListTile(
            leading: Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: sizeWidth / 9,
            ),
            title: FittedBox(
              child: Text(
                modalidade,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 23,
                ),
              ),
            ),
            trailing: Spacer(),
          ),
        ),
      ),
    );
  }
}
