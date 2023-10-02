import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/models/game.dart';

class AddGameCard extends StatelessWidget {
  const AddGameCard(this.game, {super.key});

  final Game game;

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
         height: 250,
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
         ),
       ),
    );
  }
}