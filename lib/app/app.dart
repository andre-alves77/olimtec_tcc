import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/providers/navigatorkey.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth_checker.dart';
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
import 'package:olimtec_tcc/app/features/user_role/leader/view/leader_teams_privileges.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/main_privileges_admin.dart';
import 'package:olimtec_tcc/app/features/user_role/organization/view/organization_teams_privileges%20copy.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/privilege_organization.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/addmodality/privilege_organization_addmodality.dart';
import 'package:olimtec_tcc/app/features/user_role/leader/view/privilege_team_page.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/privileges_teams.dart';
import 'package:olimtec_tcc/app/features/user_role/organization/view/privilge_organization_page.dart';
import 'package:olimtec_tcc/app/ui/champioship_page.dart';
import 'package:olimtec_tcc/app/ui/insert_modalities.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modalities_equipes.dart';

import 'package:olimtec_tcc/app/ui/organization/adicionar_jogo.dart';
import 'package:olimtec_tcc/app/ui/organization/details_game_org.dart';
import 'package:olimtec_tcc/app/ui/organization/game_score.dart';
import 'package:olimtec_tcc/app/ui/organization/insert_modality_rule_org.dart';
import 'package:olimtec_tcc/app/ui/organization/main_modalities_org.dart';
import 'package:olimtec_tcc/app/ui/organization/main_organization.dart';
import 'package:olimtec_tcc/app/ui/organization/modality_page_organization.dart';
import 'package:olimtec_tcc/app/ui/organization/scoreboard_without_points.dart';

import 'package:olimtec_tcc/app/ui/team/add_player.dart';
import 'package:olimtec_tcc/app/ui/team/createteam_page.dart';
import 'package:olimtec_tcc/app/ui/team/main_team.dart';
import 'package:olimtec_tcc/app/ui/team/modality_team.dart';
import 'package:olimtec_tcc/app/ui/team/team_players.dart';
import 'package:olimtec_tcc/app/features/theme/theme_store.dart';
import 'package:olimtec_tcc/app/features/settings/about_us_page.dart';
import 'package:olimtec_tcc/app/ui/user/index_home_user.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/cronograma_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/equipe_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/modalities_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/sport_modalitiy_page.dart';
import 'package:olimtec_tcc/app/features/settings/perfil_page.dart';
import 'package:olimtec_tcc/app/ui/user/shared/resultado_page.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';
import 'ui/admin/modalities/modalities_page.dart';

import 'features/theme/color_schemes.g.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeStore = ref.watch(themeProvider);
    final scaffoldMessengerkey = ref.read(scaffoldMessengerKeyPod);
    final navigatorKey = ref.read(navigtorkeyProvider);
    ref.watch(isLoggedProvider);
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerkey,
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
      routes: {
        IndexHomeUser.route: (ctx) => const IndexHomeUser(),
        LandingPage.route: (ctx) => LandingPage(),
        ResultadoUser.route: (ctx) => ResultadoUser(),
        ModalityUser.route: (ctx) => ModalityUser(),
        CronogramaUser.route: (ctx) => CronogramaUser(),
        AboutUsPage.route: (ctx) => AboutUsPage(),
        EquipeUser.route: (ctx) => EquipeUser(),
        PerfilUser.route: (ctx) => PerfilUser(),
        MainTeam.route: (ctx) => MainTeam(),
        ModalitiesUser.route: (context) => ModalitiesUser(),
        ModalityTeam.route: (ctx) => ModalityTeam(),
        PlayerTeam.route: (ctx) => PlayerTeam(),
        AddPlayerTeam.route: (ctx) => AddPlayerTeam(),
        CreateTeam.route: (ctx) => CreateTeam(),
        MainOrgnization.route: (ctx) => MainOrgnization(),
        MainAdmin.route: (ctx) => MainAdmin(),
        MainPrivilegeAdmin.route: (ctx) => MainPrivilegeAdmin(),
        PrivilegesTeamAdmin.route: (ctx) => PrivilegesTeamAdmin(),
        ModalityAdmin.route: (ctx) => ModalityAdmin(),
        ModalitiesAdmin.route: (ctx) => ModalitiesAdmin(),
        TeamAdmin.route: (ctx) => TeamAdmin(),
        TeamViewAdmin.route: (ctx) => TeamViewAdmin(),
        ModalitiesGamesAdmin.route: (ctx) => ModalitiesGamesAdmin(),
        RegulationAdmin.route: (ctx) => RegulationAdmin(),
        MainManagementAdmin.route: (ctx) => MainManagementAdmin(),
        RestartChampioshipAdmin.route: (ctx) => RestartChampioshipAdmin(),
        ManagementAccountAdmin.route: (ctx) => ManagementAccountAdmin(),
        PrivilegeTeamAdmin.route: (ctx) => PrivilegeTeamAdmin(),
        PrivilegeOrganizationAdmin.route: (ctx) => PrivilegeOrganizationAdmin(),
        ManagementAccountAddAdmin.route: (ctx) => ManagementAccountAddAdmin(),
        PrivilegeOrganization.route: (ctx) => PrivilegeOrganization(),
        OrganizationAddModalityAdmin.route: (ctx) =>
            OrganizationAddModalityAdmin(),
        AddTeamsAdmin.route: (ctx) => AddTeamsAdmin(),
        StartChampionshipAdmin.route: (ctx) => StartChampionshipAdmin(),
        AddModalityAdmin.route: (ctx) => AddModalityAdmin(),
        AddGameOrganization.route: (ctx) => AddGameOrganization(),
        ChampioshipPageAdmin.route: (ctx) => ChampioshipPageAdmin(),
        InsertModalitiesAdmin.route: (ctx) => InsertModalitiesAdmin(),
        ModalityOrganization.route: (ctx) => ModalityOrganization(),
        DetailsGameOrganization.route: (ctx) => DetailsGameOrganization(),
        InsertRuleOrganization.route: (ctx) => InsertRuleOrganization(),
        MainModalitiesOrganization.route: (ctx) => MainModalitiesOrganization(),
        GameScore.route: (ctx) => GameScore(),
        ScoreBoardWithoutPoints.route: (ctx) => ScoreBoardWithoutPoints(),
        LeaderTeamsPrivilegesAdmin.route: (ctx) => LeaderTeamsPrivilegesAdmin(),
        OrganizationTeamsPrivilegesAdmin.route: (ctx) => OrganizationTeamsPrivilegesAdmin(),
      },
        
      home: const LandingPage(),
    );
  }
}
