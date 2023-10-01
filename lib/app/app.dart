import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/auth/lading.store.dart';
import 'package:olimtec_tcc/app/auth/providers/auth_provider.dart';
import 'package:olimtec_tcc/app/auth/ui/auth_page.ui.dart';
import 'package:olimtec_tcc/app/ui/admin/main_admin.dart';
import 'package:olimtec_tcc/app/ui/admin/management/main_management.dart';
import 'package:olimtec_tcc/app/ui/admin/management/management_account.dart';
import 'package:olimtec_tcc/app/ui/admin/management/management_account_add.dart';
import 'package:olimtec_tcc/app/ui/admin/management/restart_champioship.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/main_modalidades_admin.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modality_admin_page.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modalities_games.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modality_team_view.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/regulation_page.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/main_privileges_admin.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/privilege_organization.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/addmodality/privilege_organization_addmodality.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/privilege_team_page.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/privileges_teams.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/privilge_organization_page.dart';
import 'package:olimtec_tcc/app/ui/champioship_page.dart';
import 'package:olimtec_tcc/app/ui/insert_modalities.dart';
import 'package:olimtec_tcc/app/ui/shared/settings/settings_page.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modalities_equipes.dart';

import 'package:olimtec_tcc/navigation/bottombar_store.dart';
import 'package:olimtec_tcc/navigation/bottombar_view.dart';
import 'package:olimtec_tcc/app/ui/organization/main_organization.dart';
import 'package:olimtec_tcc/app/ui/team/add_player.dart';
import 'package:olimtec_tcc/app/ui/team/createteam_page.dart';
import 'package:olimtec_tcc/app/ui/team/main_team.dart';
import 'package:olimtec_tcc/app/ui/team/modality_team.dart';
import 'package:olimtec_tcc/app/ui/team/team_players.dart';
import 'package:olimtec_tcc/app/theme/theme_store.dart';
import 'package:olimtec_tcc/app/ui/shared/settings/about_us_page.dart';
import 'package:olimtec_tcc/app/ui/user/live/aovivo_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/cronograma_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/equipe_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/sport_modalitiy_page.dart';
import 'package:olimtec_tcc/app/ui/shared/settings/perfil_page.dart';
import 'package:olimtec_tcc/app/ui/user/shared/resultado_page.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';
import 'ui/user/modalities/modalities_page.dart';
import 'ui/user/home/home_page.dart';

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
    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          initial: (() {
            Navigator.pushReplacementNamed(context, AppRoute.LANDING);
          }),
          authenticated: (user) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Usuário autenticado'),
                behavior: SnackBarBehavior.floating,
              ),
            );
            Navigator.pushReplacementNamed(context, AppRoute.HOME);
            // Navigate to any screen
          },
          unauthenticated: (message) =>
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message!),
                  behavior: SnackBarBehavior.floating,
                ),
              ),
          loading: () {}
          //   ref.read(formUserSignInProvider.notifier).toggleLoading(),
          );
    });

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
      initialRoute: AppRoute.LANDING,
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
        AppRoute.PRIVILEGES_TEAM: (ctx) => PrivilegesTeam(),
        AppRoute.MODALITY_ADMIN: (ctx) => ModalityAdminPage(),
        AppRoute.MODALITIES_ADMIN: (ctx) => ModalitiesPage(),
        AppRoute.TEAM_ADMIN: (ctx) => TeamAdmin(),
        AppRoute.TEAM_VIEW_ADMIN: (ctx) => ModalityTeamViewAdmin(),
        AppRoute.MODALITIES_GAMES: (ctx) => ModalitiesGames(),
        AppRoute.REGULATION_ADMIN: (ctx) => RegulationPageAdmin(),
        AppRoute.MAIN_MANAGEMENT: (ctx) => MainManagement(),
        AppRoute.RESTART_CHAMPIOSHIP: (ctx) => RestartChampioship(),
        AppRoute.MANAGEMENT_ACCOUNT: (ctx) => ManagementAccount(),
        AppRoute.PRIVILEGES_TEAM_PAGE: (ctx) => PrivilegeTeamPage(),
        AppRoute.PRIVILEGE_ORGANIZATION: (ctx) => PrivilegeOrganization(),
        AppRoute.MANAGEMENT_ACCOUNT_ADD:(ctx) => ManagementAccountAdd(),
        AppRoute.PRIVILEGE_ORGANIZATION_PAGE: (ctx) => PrivilegeOrganizationPage(),
        AppRoute.PRIVILEGE_ORGANIZATION_ADDMODALITY: (ctx) => OrganizationAddModality(),
        AppRoute.CHAMPIOSHIP_PAGE:(ctx) => ChampioshipPage(),
        AppRoute.INSERT_MODALITIES:(ctx) => InsertModalities(),
        
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
