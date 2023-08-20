import 'package:flutter/material.dart';
import 'dart:math';

import 'package:olimtec_tcc/app/models/modality/modality.dart';

class ModalityItemCard extends StatelessWidget {
  const ModalityItemCard(this._modality, {super.key});

  final Modality _modality;

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
                _modality.icon,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: sizeWidth / 9,
              ),
              title: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Text(
                  _modality.name,
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
