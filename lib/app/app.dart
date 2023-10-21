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
import 'package:olimtec_tcc/app/ui/user/index_home_user.dart';
import 'package:olimtec_tcc/app/ui/user/live/aovivo_page.dart';
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
        routes: {
          AppRoute.LANDING: (ctx) => const LandingPage(),
          AppRoute.RESULTADO_USER: (ctx) => const ResultadoPage(),
          AppRoute.MODALITY_USER: (ctx) => const SportModalityPage(),
          AppRoute.CRONOGRAMA_USER: (ctx) => const CronogramaPage(),
          AppRoute.ABOUTUS_USER: (ctx) => const AboutUsPage(),
          AppRoute.EQUIPE_USER: (ctx) => const EquipeUser(),
          AppRoute.PERFIL_USER: (ctx) => const PerfilUser(),
          AppRoute.MAIN_TEAM: (ctx) => const MainTeam(),
          AppRoute.MODALITIES_USER: (context) => const ModalitiesUserPage(),
          AppRoute.MODALITY_TEAM: (ctx) => const ModalityTeam(),
          AppRoute.PLAYER_TEAM: (ctx) => const PlayerTeam(),
          AppRoute.ADDPLAYER_TEAM: (ctx) => const AddPlayerTeam(),
          AppRoute.CREATETEAM_TEAM: (ctx) => const CreateTeamPage(),
          AppRoute.MAIN_ORGANIZATION: (ctx) => const MainOrgnization(),
          AppRoute.MAIN_ADMIN: (ctx) => const MainAdmin(),
          AppRoute.MAINPRIVILEGES_ADMIN: (ctx) => const MainPrivilegeAdmin(),
          AppRoute.PRIVILEGESTEAM_ADMIN: (ctx) => const PrivilegesTeamAdmin(),
          AppRoute.MODALITY_ADMIN: (ctx) => const ModalityAdmin(),
          AppRoute.MODALITIES_ADMIN: (ctx) => const ModalitiesPageAdmin(),
          AppRoute.TEAM_ADMIN: (ctx) => const TeamAdmin(),
          AppRoute.TEAMVIEW_ADMIN: (ctx) => const TeamViewAdmin(),
          AppRoute.MODALITIESGAMES_ADMIN: (ctx) => const ModalitiesGamesAdmin(),
          AppRoute.REGULATION_ADMIN: (ctx) => const RegulationAdmin(),
          AppRoute.MAINMANAGEMENT_ADMIN: (ctx) => const MainManagementAdmin(),
          AppRoute.RESTARTCHAMPIOSHIP_ADMIN: (ctx) =>
              const RestartChampioshipAdmin(),
          AppRoute.MANAGEMENTACCOUNT_ADMIN: (ctx) =>
              const ManagementAccountAdmin(),
          AppRoute.PRIVILEGESTEAMPAGE_ADMIN: (ctx) =>
              const PrivilegeTeamPageAdmin(),
          AppRoute.PRIVILEGEORGANIZATION_ADMIN: (ctx) =>
              const PrivilegeOrganizationAdmin(),
          AppRoute.MANAGEMENTACCOUNTADD_ADMIN: (ctx) =>
              const ManagementAccountAddAdmin(),
          AppRoute.PRIVILEGEORGANIZATIONPAGE_ADMIN: (ctx) =>
              const PrivilegeOrganizationPage(),
          AppRoute.PRIVILEGEORGANIZATIONADDMODALITY_ADMIN: (ctx) =>
              const OrganizationAddModalityAdmin(),
          AppRoute.ADDTEAMS_ADMIN: (ctx) => const AddTeamsAdmin(),
          AppRoute.STARTCHAMPIONSHIP_ADMIN: (ctx) =>
              const StartChampionshipAdmin(),
          AppRoute.ADDMODALITY_ADMIN: (ctx) => const AddModalityAdmin(),
          AppRoute.ADDGAME_ORGANIZATION: (ctx) => const AddGameOrganization(),
          AppRoute.CHAMPIOSHIPPAGE_ADMIN: (ctx) => const ChampioshipPageAdmin(),
          AppRoute.INSERTMODALITIES_ADMIN: (ctx) =>
              const InsertModalitiesAdmin(),
          AppRoute.MODALITYPAGE_ORGANIZATION: (ctx) =>
              const ModalityPageOrganization(),
          AppRoute.DETAILSGAME_ORGANIZATION: (ctx) =>
              const DetailsGameOrganization(),
          AppRoute.INSERTRULE_ORGANIZATION: (ctx) =>
              const InsertRuleOrganization(),
          AppRoute.MAINMODALITIES_ORGANIZATION: (ctx) =>
              const MainModalitiesOrganization(),
        },
        home: const IndexHomeUser());
  }
}
