import 'package:flutter/material.dart';

import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/ui/team/createteam_page.dart';
import 'package:olimtec_tcc/app/ui/team/modality_team.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class MainTeam extends StatefulWidget {
  const MainTeam({super.key});

  static String route = "/main_team";

  @override
  State<MainTeam> createState() => _MainTeamState();
}

class _MainTeamState extends State<MainTeam> {
  @override
  Widget build(BuildContext context) {
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'REPRESENTANTE',
          style: TextStyle(
            fontFamily: 'Lato',
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ModalityTeam.route,
                      arguments: arg);
                },
                child: OptionConfig(
                    icone: Icons.person_add,
                    text1: "EQUIPES ",
                    text2: "(INSERIR ALUNOS NAS EQUIPES)"),
              ),
              Padding(padding: EdgeInsets.all(15)),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CreateTeam.route);
                  },
                  child: OptionConfig(
                      icone: Icons.settings,
                      text1: "CONFIGURAR TIME ",
                      text2: "(MODIFICAR O TIME)")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
