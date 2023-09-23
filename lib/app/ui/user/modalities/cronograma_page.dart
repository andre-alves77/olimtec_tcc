import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/ui/user/shared/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';

class CronogramaPage extends StatefulWidget {
  const CronogramaPage({super.key});

  @override
  State<CronogramaPage> createState() => _CronogramaPageState();
}

class _CronogramaPageState extends State<CronogramaPage> {
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
        title: FittedBox(
          child: Text(
            "3ºEAA VS 1ºEAB",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: sizeWidth / 1.2,
                  child: FittedBox(
                    child: Text(
                      "BASQUETE MASCULINO",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontFamily: 'Lato',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GameCard(gametest),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: sizeWidth / 1.8,
                    child: const FittedBox(
                      child: Text(
                        "INFORMAÇÕES",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
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
                          _rowzinha('LOCAL', 'QUADRA 01'),
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: sizeWidth / 2,
                    child: const FittedBox(
                      child: Text(
                        'OUTROS JOGOS',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GameCard(gametest),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
