import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/navigation/bottombar_store.dart';
import 'package:olimtec_tcc/app/navigation/bottombar_view.dart';
import 'package:olimtec_tcc/app/pages/aovivo_page.dart';
import 'package:olimtec_tcc/app/pages/settings_page.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';
import 'pages/modalities_page.dart';
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
      routes: AppRoute.LANDING: (ctx) => LandingPage(),
        AppRoute.RESULTADO: (ctx) => ResultadoPage(),
        AppRoute.MODALITY_PAGE: (ctx) => SportModalityPage(),
        AppRoute.CRONOGRAMA: (ctx) => CronogramaPage(),
        AppRoute.ABOUT_US: (ctx) => AboutUsPage(),
        AppRoute.EQUIPE: (ctx) => MainEquipe(),
        AppRoute.PERFIL: (ctx) => PerfilPage(),

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
