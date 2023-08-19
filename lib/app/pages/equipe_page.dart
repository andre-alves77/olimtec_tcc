import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/components/game_card.dart';
import 'package:olimtec_tcc/app/components/main_card.dart';
import 'package:olimtec_tcc/app/components/test_widget.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';

class MainEquipe extends StatefulWidget {
  const MainEquipe({super.key});

  @override
  State<MainEquipe> createState() => _MainEquipeState();
}

class _MainEquipeState extends State<MainEquipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          automaticallyImplyLeading: false,
          leading: Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                Theme.of(context).brightness == Brightness.light
                    ? 'assets/images/LOGO_LIGHT_MODE.png'
                    : 'assets/images/LOGO_DARK_MODE.png',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            'EQUIPES',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
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
              Container(
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
                  color: Theme.of(context).errorColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          Container(
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
          Container(
            color: Colors.black,
            child: ListView(
              children: [
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/LOGO_LIGHT_MODE.png'
                      ),
                      backgroundColor: Colors.amber,
                      radius: 120,
                    ),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
