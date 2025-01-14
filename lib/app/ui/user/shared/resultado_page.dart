import 'dart:math';

import 'package:flutter/material.dart';

import 'game_card.dart';
import '../../../data/dummy_data.dart';

class ResultadoUser extends StatelessWidget {
  const ResultadoUser({super.key});

  static String route = "/resultado-user";

  Widget _rowzinha(String head, String info) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FittedBox(
          child: Text(
            "$head - ",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            info,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.normal,
              fontFamily: 'Lato',
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
        title: Text(
          'RESULTADO',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FittedBox(
              child: Text(
                'BASQUETE MASCULINO',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            ConstrainedBox(
              child: GameCard(gametest),
              constraints: BoxConstraints(maxWidth: 400),
            ),
            FittedBox(
              child: Text(
                'INFORMAÇÕES',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: FittedBox(
                child: Container(
                  width: sizeWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Container(
                    width: sizeWidth / 2,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        children: <Widget>[
                          _rowzinha('LOCAL', 'QUADRA 02'),
                          SizedBox(
                            width: sizeWidth,
                            child: Divider(
                              height: 2,
                              thickness: 1,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                          _rowzinha('HORÁRIO', '8:45'),
                          SizedBox(
                            width: sizeWidth,
                            child: Divider(
                              height: 2,
                              thickness: 1,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                          _rowzinha('DATA', '01/08'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FittedBox(
              child: Text(
                'MÍDIA DO JOGO',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
