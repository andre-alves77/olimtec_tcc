import 'package:flutter/material.dart';

import '../../shared/option_config.dart';

class MainTeam extends StatefulWidget {
  const MainTeam({super.key});

  @override
  State<MainTeam> createState() => _MainTeamState();
}

class _MainTeamState extends State<MainTeam> {
  @override
  Widget build(BuildContext context) {
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
                  Navigator.pushNamed(context, '/modality_team');
                },
                child: OptionConfig(
                    icone: Icons.person_add,
                    text1: "EQUIPES ",
                    text2: "(INSERIR ALUNOS NAS EQUIPES)"),
              ),
              Padding(padding: EdgeInsets.all(15)),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/createteam_page');
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
