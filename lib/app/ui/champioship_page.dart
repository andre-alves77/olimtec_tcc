import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:olimtec_tcc/app/shared/views/option_config.dart';

class ChampioshipPage extends StatelessWidget {
  const ChampioshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CAMPEONATO',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/insert_modalities");
                      },
                      child: OptionConfig(
                          icone: Icons.sports, text1: 'DEFINIR MODALIDADES')),
                ),
              ),
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OptionConfig(
                    icone: Icons.shield_sharp, text1: 'ADICIONAR TIMES'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'AO CLICAR NO BOTÃO ABAIXO O CAMPEONATO\nDE TODAS AS MODALIDADES SERÁ INICIADO',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: SizedBox(
                width: sizeWidth / 1.3,
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: const Color(0xFFEDEDED),
                  ),
                  child: const FittedBox(
                    child: Text(
                      "INICIAR CAMPEONATO",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
