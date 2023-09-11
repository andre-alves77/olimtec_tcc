import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/navigation/bottombar_store.dart';
import 'package:olimtec_tcc/app/navigation/bottombar_view.dart';
import 'package:olimtec_tcc/app/pages/aovivo_page.dart';
import 'package:olimtec_tcc/app/pages/equipe_page.dart';
import 'package:olimtec_tcc/app/pages/modalities_page.dart';
import 'package:olimtec_tcc/app/pages/perfil_page.dart';
import 'package:olimtec_tcc/app/pages/resultado_page.dart';
import 'package:olimtec_tcc/app/pages/settings_page.dart';
import 'package:olimtec_tcc/app/pages/about_us_page.dart';
import 'package:olimtec_tcc/utils/routes_consts.dart';

import 'pages/cronograma_page.dart';
import 'pages/home_page.dart';

import 'theme/color_schemes.g.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final BottomBarStore _bottomBarStore = BottomBarStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomBarStore.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: lightColorScheme,
          fontFamily: 'Lato'),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: darkColorScheme,
        fontFamily: 'Lato',
      ),
      title: 'OLIMTEC',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.ABOUT_US: (context) => AboutUsPage(),
        AppRoutes.CRONOGRAM: (context) => CronogramaPage(),
        AppRoutes.PROFILE: (context) => PerfilPage(),
        AppRoutes.RESULT: (context) => ResultadoPage(),
        AppRoutes.TEAM: (context) => MainEquipe(),
      },
      home: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomBar(bottomStore: _bottomBarStore),
        body: SafeArea(
          child: IndexedStack(
            children: [
              HomePage(),
              ModalitiesPage(),
              MainAoVivo(),
              SettingsPage(),
            ],
            index: _bottomBarStore.index,
          ),
        ),
      ),
    );
  }
}
