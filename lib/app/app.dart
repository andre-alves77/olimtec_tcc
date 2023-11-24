import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/providers/navigatorkey.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
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
import 'package:olimtec_tcc/app/ui/admin/privileges/addmodality/privilege_organization_addmodality.dart';
import 'package:olimtec_tcc/app/features/user_role/leader/view/privilege_team_page.dart';
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
    ref.watch(appUserProvider);
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
        LandingPage.route: (ctx) => const LandingPage(),
        ResultadoUser.route: (ctx) => const ResultadoUser(),
        ModalityUser.route: (ctx) => const ModalityUser(),
        CronogramaUser.route: (ctx) => const CronogramaUser(),
        AboutUsPage.route: (ctx) => const AboutUsPage(),
        EquipeUser.route: (ctx) => const EquipeUser(),
        PerfilUser.route: (ctx) => const PerfilUser(),
        MainTeam.route: (ctx) => const MainTeam(),
        ModalitiesUser.route: (context) => const ModalitiesUser(),
        ModalityTeam.route: (ctx) => const ModalityTeam(),
        PlayerTeam.route: (ctx) => const PlayerTeam(),
        AddPlayerTeam.route: (ctx) => const AddPlayerTeam(),
        CreateTeam.route: (ctx) => const CreateTeam(),
        MainOrgnization.route: (ctx) => const MainOrgnization(),
        MainAdmin.route: (ctx) => const MainAdmin(),
        MainPrivilegeAdmin.route: (ctx) => const MainPrivilegeAdmin(),
        ModalityAdmin.route: (ctx) => const ModalityAdmin(),
        ModalitiesAdmin.route: (ctx) => const ModalitiesAdmin(),
        TeamAdmin.route: (ctx) => const TeamAdmin(),
        TeamViewAdmin.route: (ctx) => const TeamViewAdmin(),
        ModalitiesGamesAdmin.route: (ctx) => const ModalitiesGamesAdmin(),
        RegulationAdmin.route: (ctx) => const RegulationAdmin(),
        MainManagementAdmin.route: (ctx) => const MainManagementAdmin(),
        RestartChampioshipAdmin.route: (ctx) => const RestartChampioshipAdmin(),
        ManagementAccountAdmin.route: (ctx) => const ManagementAccountAdmin(),
        PrivilegeTeamAdmin.route: (ctx) => const PrivilegeTeamAdmin(),
        ManagementAccountAddAdmin.route: (ctx) =>
            const ManagementAccountAddAdmin(),
        PrivilegeOrganization.route: (ctx) => const PrivilegeOrganization(),
        OrganizationAddModalityAdmin.route: (ctx) =>
            const OrganizationAddModalityAdmin(),
        AddTeamsAdmin.route: (ctx) => const AddTeamsAdmin(),
        StartChampionshipAdmin.route: (ctx) => const StartChampionshipAdmin(),
        AddModalityAdmin.route: (ctx) => const AddModalityAdmin(),
        AddGameOrganization.route: (ctx) => const AddGameOrganization(),
        ChampioshipPageAdmin.route: (ctx) => const ChampioshipPageAdmin(),
        InsertModalitiesAdmin.route: (ctx) => const InsertModalitiesAdmin(),
        ModalityOrganization.route: (ctx) => const ModalityOrganization(),
        DetailsGameOrganization.route: (ctx) => const DetailsGameOrganization(),
        InsertRuleOrganization.route: (ctx) => const InsertRuleOrganization(),
        MainModalitiesOrganization.route: (ctx) =>
            const MainModalitiesOrganization(),
        GameScore.route: (ctx) => GameScore(),
        ScoreBoardWithoutPoints.route: (ctx) => const ScoreBoardWithoutPoints(),
        LeaderTeamsPrivilegesAdmin.route: (ctx) =>
            const LeaderTeamsPrivilegesAdmin(),
        OrganizationTeamsPrivilegesAdmin.route: (ctx) =>
            const OrganizationTeamsPrivilegesAdmin(),
      },
      home: const LandingPage(),
    );
  }
}
