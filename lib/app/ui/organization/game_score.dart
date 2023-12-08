import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';










class GameScore extends ConsumerStatefulWidget {
  const GameScore({super.key});
  static String route = "/gamescore-organization";
  

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameScoreState();
}


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

class _GameScoreState extends ConsumerState<GameScore> {
  int _counter = 0;
  int _time2 = 0;
  int _foulsTime1 = 0;
  int _foulsTime2 = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _incrementTime2() {
    setState(() {
      _time2++;
    });
  }

  void _decrementTime2() {
    setState(() {
      _time2--;
    });
  }

  void _incrementFoulsTime1() {
    setState(() {
      _foulsTime1++;
    });
  }

  void _decrementFoulsTime1() {
    setState(() {
      _foulsTime1--;
    });
  }

  void _incrementFoulsTime2() {
    setState(() {
      _foulsTime2++;
    });
  }

  void _decrementFoulsTime2() {
    setState(() {
      _foulsTime2--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
        final String? argModality =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: const Text(
            "2ºEAA VS 1ºDSB",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BASQUETE MASCULINO',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FittedBox(
                child: Container(
                  width: 382,
                  height: 440,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'PONTUAÇÃO',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 362,
                            height: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/LOGO_1EAA_EXAMPLE.png',
                                    width: 110,
                                    height: 110,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 0, 10, 0),
                                  child: Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'VS',
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 28,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 22),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'assets/images/LOGO_2DSB_EXAMPLE.png',
                                          width: 100,
                                          height: 110,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              '2ºEAA',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Em andamento',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              '1ºDSB',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 105,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: _decrementCounter,
                                  ),
                                  AnimatedOpacity(
                                    opacity: _counter != 0 ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 500),
                                    child: Text(
                                      '$_counter',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: _incrementCounter,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              child: VerticalDivider(
                                width: 5,
                                thickness: 2,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                            Container(
                              width: 105,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: _decrementTime2,
                                  ),
                                  AnimatedOpacity(
                                    opacity: _time2 != 0 ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 500),
                                    child: Text(
                                      '$_time2',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: _incrementTime2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 2,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'QUANTIDADE DE FALTAS',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 105,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: _decrementFoulsTime1,
                                  ),
                                  AnimatedOpacity(
                                    opacity: _foulsTime1 != 0 ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 500),
                                    child: Text(
                                      '$_foulsTime1',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: _incrementFoulsTime1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              child: VerticalDivider(
                                width: 5,
                                thickness: 2,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                            Container(
                              width: 105,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: _decrementFoulsTime2,
                                  ),
                                  AnimatedOpacity(
                                    opacity: _foulsTime2 != 0 ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 500),
                                    child: Text(
                                      '$_foulsTime2',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: _incrementFoulsTime2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 2,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Text(
                                'TEMPO: 00:00',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            autofocus: true,
                            focusColor: Theme.of(context).colorScheme.primary,
                            hoverColor: Theme.of(context).colorScheme.primary,
                            onPressed: () {},
                            icon: Icon(
                              Icons.pause,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Container(
                          width: 260,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.error,
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'FINALIZAR JOGO',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
              Padding(
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  child: Text(
                    'OUTROS JOGOS',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
