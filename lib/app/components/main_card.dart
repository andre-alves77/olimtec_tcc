import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/models/game.dart';

class MainCard extends StatelessWidget {
  const MainCard(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 20,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20)),
          width: sizeWidth,
          child: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: sizeWidth / 1.4,
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              game.time,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(' - '),
                            Text(
                              game.modalidade,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: sizeWidth / 5,
                      child: FittedBox(
                        child: Text(
                          game.local,
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          game.team1.image,
                          width: sizeWidth / 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          Theme.of(context).brightness == Brightness.dark
                              ? 'assets/images/IMAGE_VS_L.png'
                              : 'assets/images/IMAGE_VS.png',
                          width: sizeWidth / 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          game.team2.image,
                          width: sizeWidth / 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: sizeWidth / 7,
                          child: FittedBox(
                            child: Text(
                              game.team1.name,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: sizeWidth / 10,
                        ),
                        Container(
                          width: sizeWidth / 7,
                          child: FittedBox(
                            child: Text(
                              game.team2.name,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
