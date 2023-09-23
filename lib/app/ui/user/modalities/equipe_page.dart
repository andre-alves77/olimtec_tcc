import 'package:flutter/material.dart';
import 'dart:math';

class MainEquipe extends StatefulWidget {
  const MainEquipe({super.key});

  @override
  State<MainEquipe> createState() => _MainEquipeState();
}

class _MainEquipeState extends State<MainEquipe> {
  _CardJogador() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            'assets/images/LOGO_USUARIO.png',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'Fulano de tal',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'EQUIPES',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '2ºDSB',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                  FittedBox(
                    child: Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/LOGO_2DSB_EXAMPLE.png',
                          width: 170,
                          height: 170,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'DRAGÕES DA ALVORADA',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Máximo de participantes: 9',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
              FittedBox(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'PARTICIPANTES',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 2,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  constraints: BoxConstraints(maxWidth: sizeWidth),
                  height: 400,
                  child: ListView(
                    children: [
                      _CardJogador(),
                      Divider(
                          height: 2,
                          thickness: 1.5,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      _CardJogador(),
                      Divider(
                          height: 2,
                          thickness: 1.5,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      _CardJogador(),
                      Divider(
                          height: 2,
                          thickness: 1.5,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
