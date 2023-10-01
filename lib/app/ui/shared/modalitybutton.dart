import 'dart:math';

import 'package:flutter/material.dart';

class ModalityButton extends StatelessWidget {
  const ModalityButton(this.text, this.clicado, {super.key});

  final String text;
  final Function clicado;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    
    return SizedBox(
      width: sizeWidth / 1.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor:
          Theme.of(context).colorScheme.primary,
          foregroundColor:const Color(0xFFEDEDED),
        ),
        child: FittedBox(
          child: Text(
             text,
             style: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: () {
          clicado;
        },
      ),
    );
  }
}