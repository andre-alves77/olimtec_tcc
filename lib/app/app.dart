import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/components/game_card.dart';
import 'package:olimtec_tcc/app/components/main_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/models/teamList.dart';
import 'package:olimtec_tcc/app/pages/aovivo_page.dart';
import 'package:olimtec_tcc/app/pages/equipe_page.dart';
import 'package:olimtec_tcc/app/pages/landing_page/landing_page.dart';
import 'package:olimtec_tcc/app/pages/resultado_page.dart';

import 'pages/cronograma_page.dart';
import 'pages/home_page.dart';
import 'pages/sport_modalitiy_page.dart';
import 'theme/color_schemes.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLIMTEC',
      theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: lightColorScheme,
          fontFamily: 'Lato'),
      darkTheme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: darkColorScheme,
        fontFamily: 'Lato',
      ),
      themeMode: ThemeMode.system,
      home: CronogramaPage(),
    );
  }
}
