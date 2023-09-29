import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/models/game.dart';

class GameCard extends StatelessWidget {
  GameCard(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/cronograma_page");
      },
      child: AspectRatio(
        aspectRatio: 2.8,
        child: Card(
          margin: EdgeInsets.all(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            width: sizeWidth,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          children: [
                            Text(
                              game.modalidade,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 17.8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(' - '),
                            Text(
                              game.local,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 17.8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: FittedBox(
                      child: Container(
                        width: 330,
                        child: Divider(
                          height: 1,
                          thickness: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              game.team1.image,
                              width: sizeWidth / 6,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            game.team1.name,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 6.5),
                              width: 100,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '41 : 22',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: game.gameState == GameState.predicted
                                    ? Text(
                                        'Previsto',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer),
                                      )
                                    : game.gameState == GameState.inProgress
                                        ? Text(
                                            '• Em andamento',
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.redAccent),
                                          )
                                        : Text(
                                            'Encerrado',
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                game.team2.image,
                                width: sizeWidth / 6,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              game.team2.name,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
