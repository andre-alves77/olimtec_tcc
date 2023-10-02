import 'package:flutter/material.dart';
import 'dart:math';

import 'package:olimtec_tcc/app/models/modality/modality.dart';

class ModalityItemCardAdmin extends StatelessWidget {
  const ModalityItemCardAdmin(
      {required this.func, required this.modality, super.key});

  final Modality modality;
  final Function() func;
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return AspectRatio(
      aspectRatio: 4.5,
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
                modality.icon,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: sizeWidth / 9,
              ),
              trailing: IconButton(
                onPressed: func,
                icon: Icon(Icons.remove, color: Colors.red),
              ),
              title: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Text(
                  modality.name,
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
    );
  }
}
