import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';

class RestartChampioship extends StatelessWidget {
  const RestartChampioship({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'REINICIAR CAMPEONATO',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionConfig(
                  icone: Icons.emoji_events,
                  text1: 'REINICIAR CAMPEONATO',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
