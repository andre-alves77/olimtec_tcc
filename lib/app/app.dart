import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/auth/view/landing_page.view.dart';
import 'package:olimtec_tcc/app/ui/admin/before_config/add_modality_component.dart';
import 'package:olimtec_tcc/app/ui/admin/before_config/add_teams.dart';
import 'package:olimtec_tcc/app/ui/admin/before_config/start_championship.dart';
import 'package:olimtec_tcc/app/ui/admin/main_admin.dart';
import 'package:olimtec_tcc/app/ui/admin/management/main_management.dart';
import 'package:olimtec_tcc/app/ui/admin/management/management_account.dart';
import 'package:olimtec_tcc/app/ui/admin/management/management_account_add.dart';
import 'package:olimtec_tcc/app/ui/admin/management/restart_champioship.dart';
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
import 'package:olimtec_tcc/app/features/settings/settings_page.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modalities_equipes.dart';

import 'package:olimtec_tcc/app/features/navigation/bottombar_store.dart';
import 'package:olimtec_tcc/app/features/navigation/bottombar_view.dart';
import 'package:olimtec_tcc/app/ui/organization/adicionar_jogo.dart';
import 'package:olimtec_tcc/app/ui/organization/details_game_org.dart';
import 'package:olimtec_tcc/app/ui/organization/insert_modality_rule_org.dart';
import 'package:olimtec_tcc/app/ui/organization/main_modalities_org.dart';
import 'package:olimtec_tcc/app/ui/organization/main_organization.dart';
import 'package:olimtec_tcc/app/ui/organization/modality_page_organization.dart';

import 'package:olimtec_tcc/app/ui/team/add_player.dart';
import 'package:olimtec_tcc/app/ui/team/createteam_page.dart';
import 'package:olimtec_tcc/app/ui/team/main_team.dart';
import 'package:olimtec_tcc/app/ui/team/modality_team.dart';
import 'package:olimtec_tcc/app/ui/team/team_players.dart';
import 'package:olimtec_tcc/app/features/theme/theme_store.dart';
import 'package:olimtec_tcc/app/features/settings/about_us_page.dart';
import 'package:olimtec_tcc/app/ui/user/live/aovivo_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/cronograma_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/equipe_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/modalities_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/sport_modalitiy_page.dart';
import 'package:olimtec_tcc/app/features/settings/perfil_page.dart';
import 'package:olimtec_tcc/app/ui/user/shared/resultado_page.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';
import 'ui/admin/modalities/modalities_page.dart';
import 'ui/user/home/home_page.dart';

import 'features/theme/color_schemes.g.dart';

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
      initialRoute: AppRoute.HOME_USER,
      routes: {
        AppRoute.LANDING: (ctx) => LandingPage(),
        AppRoute.RESULTADO_USER: (ctx) => ResultadoPage(),
        AppRoute.MODALITY_USER: (ctx) => SportModalityPage(),
        AppRoute.CRONOGRAMA_USER: (ctx) => CronogramaPage(),
        AppRoute.ABOUTUS_USER: (ctx) => AboutUsPage(),
        AppRoute.EQUIPE_USER: (ctx) => EquipeUser(),
        AppRoute.PERFIL_USER: (ctx) => PerfilUser(),
        AppRoute.MAIN_TEAM: (ctx) => MainTeam(),
        AppRoute.MODALITIES_USER: (context) => ModalitiesUserPage(),
        AppRoute.MODALITY_TEAM: (ctx) => ModalityTeam(),
        AppRoute.PLAYER_TEAM: (ctx) => PlayerTeam(),
        AppRoute.ADDPLAYER_TEAM: (ctx) => AddPlayerTeam(),
        AppRoute.CREATETEAM_TEAM: (ctx) => CreateTeamPage(),
        AppRoute.MAIN_ORGANIZATION: (ctx) => MainOrgnization(),
        AppRoute.MAIN_ADMIN: (ctx) => MainAdmin(),
        AppRoute.MAINPRIVILEGES_ADMIN: (ctx) => MainPrivilegeAdmin(),
        AppRoute.PRIVILEGESTEAM_ADMIN: (ctx) => PrivilegesTeamAdmin(),
        AppRoute.MODALITY_ADMIN: (ctx) => ModalityAdmin(),
        AppRoute.MODALITIES_ADMIN: (ctx) => ModalitiesPageAdmin(),
        AppRoute.TEAM_ADMIN: (ctx) => TeamAdmin(),
        AppRoute.TEAMVIEW_ADMIN: (ctx) => TeamViewAdmin(),
        AppRoute.MODALITIESGAMES_ADMIN: (ctx) => ModalitiesGamesAdmin(),
        AppRoute.REGULATION_ADMIN: (ctx) => RegulationAdmin(),
        AppRoute.MAINMANAGEMENT_ADMIN: (ctx) => MainManagementAdmin(),
        AppRoute.RESTARTCHAMPIOSHIP_ADMIN: (ctx) => RestartChampioshipAdmin(),
        AppRoute.MANAGEMENTACCOUNT_ADMIN: (ctx) => ManagementAccountAdmin(),
        AppRoute.PRIVILEGESTEAMPAGE_ADMIN: (ctx) => PrivilegeTeamPageAdmin(),
        AppRoute.PRIVILEGEORGANIZATION_ADMIN: (ctx) =>
            PrivilegeOrganizationAdmin(),
        AppRoute.MANAGEMENTACCOUNTADD_ADMIN: (ctx) =>
            ManagementAccountAddAdmin(),
        AppRoute.PRIVILEGEORGANIZATIONPAGE_ADMIN: (ctx) =>
            PrivilegeOrganizationPage(),
        AppRoute.PRIVILEGEORGANIZATIONADDMODALITY_ADMIN: (ctx) =>
            OrganizationAddModalityAdmin(),
        AppRoute.ADDTEAMS_ADMIN: (ctx) => AddTeamsAdmin(),
        AppRoute.STARTCHAMPIONSHIP_ADMIN: (ctx) => StartChampionshipAdmin(),
        AppRoute.ADDMODALITY_ADMIN: (ctx) => AddModalityAdmin(),
        AppRoute.ADDGAME_ORGANIZATION: (ctx) => AddGameOrganization(),
        AppRoute.CHAMPIOSHIPPAGE_ADMIN: (ctx) => ChampioshipPageAdmin(),
        AppRoute.INSERTMODALITIES_ADMIN: (ctx) => InsertModalitiesAdmin(),
        AppRoute.MODALITYPAGE_ORGANIZATION: (ctx) => ModalityPageOrganization(),
        AppRoute.DETAILSGAME_ORGANIZATION: (ctx) => DetailsGameOrganization(),
        AppRoute.INSERTRULE_ORGANIZATION: (ctx) => InsertRuleOrganization(),
        AppRoute.MAINMODALITIES_ORGANIZATION: (ctx) =>
            MainModalitiesOrganization(),
      },
      home: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomBar(),
        body: SafeArea(
          child: IndexedStack(
            index: bottomBarStore,
            children: const [
              HomeUser(),
              ModalitiesUserPage(),
              AoVivoUser(),
              SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
