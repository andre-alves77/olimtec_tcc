import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/admin/main_admin.dart';
import 'package:olimtec_tcc/app/admin/privileges/main_privileges_admin.dart';

import 'package:olimtec_tcc/app/navigation/bottombar_store.dart';
import 'package:olimtec_tcc/app/navigation/bottombar_view.dart';
import 'package:olimtec_tcc/app/organization/main_organization.dart';
import 'package:olimtec_tcc/app/team/add_player.dart';
import 'package:olimtec_tcc/app/team/createteam_page.dart';
import 'package:olimtec_tcc/app/team/main_team.dart';
import 'package:olimtec_tcc/app/team/modality_team.dart';
import 'package:olimtec_tcc/app/team/team_players.dart';
import 'package:olimtec_tcc/app/theme/theme_store.dart';
import 'package:olimtec_tcc/app/user/settings/about_us_page.dart';
import 'package:olimtec_tcc/app/user/live/aovivo_page.dart';
import 'package:olimtec_tcc/app/user/modalities/cronograma_page.dart';
import 'package:olimtec_tcc/app/user/modalities/equipe_page.dart';
import 'package:olimtec_tcc/app/user/landing_page/landing_page.dart';
import 'package:olimtec_tcc/app/user/modalities/sport_modalitiy_page.dart';
import 'package:olimtec_tcc/app/user/settings/perfil_page.dart';
import 'package:olimtec_tcc/app/user/shared/resultado_page.dart';
import 'package:olimtec_tcc/app/user/settings/settings_page.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

import 'user/modalities/modalities_page.dart';
import 'user/home/home_page.dart';

import 'theme/color_schemes.g.dart';

final themeProvider = StateNotifierProvider<ThemeStore, ThemeMode>((ref) {
  return ThemeStore();
});

final bottomBarProvider =
    StateNotifierProvider<BottomBarStore, int>((ref) => BottomBarStore());

class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeStore = ref.watch(themeProvider);
    final bottomBarStore = ref.watch(bottomBarProvider);

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
      themeMode: themeModeStore,
      debugShowCheckedModeBanner: false,
      initialRoute: '/landing_page',
      routes: {
        AppRoute.LANDING: (ctx) => LandingPage(),
        AppRoute.RESULTADO: (ctx) => ResultadoPage(),
        AppRoute.MODALITY_PAGE: (ctx) => SportModalityPage(),
        AppRoute.CRONOGRAMA: (ctx) => CronogramaPage(),
        AppRoute.ABOUT_US: (ctx) => AboutUsPage(),
        AppRoute.EQUIPE: (ctx) => MainEquipe(),
        AppRoute.PERFIL: (ctx) => PerfilPage(),
        AppRoute.MAIN_TEAM: (ctx) => MainTeam(),
        AppRoute.MODALITY_TEAM: (ctx) => TeamModality(),
        AppRoute.TEAM_PLAYER: (ctx) => TeamPlayers(),
        AppRoute.ADD_PLAYER: (ctx) => AddPlayerPage(),
        AppRoute.CREATE_TEAM: (ctx) => CreateTeam(),
        AppRoute.MAIN_ORGANIZATION: (ctx) => MainOrgnization(),
        AppRoute.MAIN_ADMIN: (ctx) => MainAdmin(),
        AppRoute.MAIN_PRIVILEGES: (ctx) => MainPrivilege(),
      },
      home: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomBar(),
        body: SafeArea(
          child: IndexedStack(
            index: bottomBarStore,
            children: const [
              HomePage(),
              ModalitiesPage(),
              MainAoVivo(),
              SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
