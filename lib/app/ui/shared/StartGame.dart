import 'dart:math';

import 'package:flutter/material.dart';

class StartGame extends StatelessWidget {
  const StartGame({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.all(8),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Center(
              child: Expanded(
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: sizeWidth,
                    height: 175,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'HORÁRIO: 10:20',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth,
                            child: Divider(
                              height: 10,
                              thickness: 2,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: sizeWidth,
                              height: 1,
                              decoration:
                                  BoxDecoration(), //colocar as cores nessas box decoration
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5, 0, 5, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'assets/images/LOGO_1EAA_EXAMPLE.png',
                                    width: sizeWidth / 8,
                                    height: 60,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      7, 0, 5, 0),
                                  child: Text(
                                    '1EAA',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Text(
                                  'VS',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      7, 0, 5, 0),
                                  child: Text(
                                    '2DSB',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'assets/images/LOGO_2DSB_EXAMPLE.png',
                                    width: sizeWidth / 8,
                                    height: 60,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth,
                            child: Divider(
                              height: 5,
                              thickness: 2,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'VER DETALHES',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  width: 5,
                                  thickness: 2,
                                ),
                              ),
                              Text(
                                'COMEÇAR JOGO',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Expanded(
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: sizeWidth,
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'HORÁRIO: 11:20',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth,
                            child: Divider(
                              height: 10,
                              thickness: 2,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: sizeWidth,
                              height: 1,
                              decoration:
                                  BoxDecoration(), //colocar as cores nessas box decoration
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5, 0, 5, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'assets/images/LOGO_1EAA_EXAMPLE.png',
                                    width: sizeWidth / 8,
                                    height: 60,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      7, 0, 5, 0),
                                  child: Text(
                                    '1EAA',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Text(
                                  'VS',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      7, 0, 5, 0),
                                  child: Text(
                                    '2DSB',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'assets/images/LOGO_2DSB_EXAMPLE.png',
                                    width: sizeWidth / 8,
                                    height: 60,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth,
                            child: Divider(
                              height: 5,
                              thickness: 2,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'VER DETALHES',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  width: 5,
                                  thickness: 2,
                                ),
                              ),
                              Text(
                                'COMEÇAR JOGO',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
