import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/features/organization/add_games/organization_games.dart';
import 'package:olimtec_tcc/app/ui/organization/organization_modalities.dart';
import 'package:olimtec_tcc/app/ui/organization/regulation_modalities.dart';

class MainOrgnization extends StatefulWidget {
  const MainOrgnization({super.key});

  static String route = "/main-organization";

  @override
  State<MainOrgnization> createState() => _MainOrgnizationState();
}

class _MainOrgnizationState extends State<MainOrgnization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ORGANIZAÇÃO',
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
                  Navigator.pushNamed(context, GamesOrganization.route);
                },
                child: OptionConfig(
                    icone: Icons.add,
                    text1: "ADICIONAR JOGOS ",
                    text2: "(CRONOGRAMA DO CHAVEAMENTO)"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ModalitiesOrganization.route);
                },
                child: OptionConfig(
                  icone: Icons.play_circle_filled,
                  text1: "COMEÇAR JOGOS",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, RegulationModalitiesOrganization.route);
                },
                child: OptionConfig(
                    icone: Icons.mode,
                    text1: "MODIFICAR REGULAMENTO",
                    text2: "(DE CADA MODALIDADE)"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
