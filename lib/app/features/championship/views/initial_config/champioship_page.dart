import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/features/championship/initial_config.store.dart';
import 'package:olimtec_tcc/app/features/championship/views/initial_config/add_locals.dart';
import 'package:olimtec_tcc/app/features/championship/views/initial_config/add_modality_component.dart';
import 'package:olimtec_tcc/app/features/championship/views/initial_config/add_teams.dart';
import 'dart:math';

import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/ui/insert_modalities.dart';
import 'package:provider/provider.dart';

class ChampioshipPageAdmin extends ConsumerWidget {
  const ChampioshipPageAdmin({super.key});

  static String route = "/champioshippage-admin";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CAMPEONATO',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AddModalityAdmin.route);
                      },
                      child: OptionConfig(
                          icone: Icons.sports, text1: 'DEFINIR MODALIDADES')),
                ),
              ),
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AddTeamsAdmin.route);
                  },
                  child: OptionConfig(
                      icone: Icons.shield_sharp, text1: 'ADICIONAR TIMES'),
                ),
              ),
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AddLocalsAdmin.route);
                      },
                      child: OptionConfig(
                        icone: Icons.map_outlined,
                        text1: 'DEFINIR LOCAIS',
                        text2: "QUADRA, MULTIMIDIA  E ETC",
                      )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'AO CLICAR NO BOTÃO ABAIXO O CAMPEONATO\nDE TODAS AS MODALIDADES SERÁ INICIADO',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: SizedBox(
                width: sizeWidth / 1.3,
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: const Color(0xFFEDEDED),
                  ),
                  child: const FittedBox(
                    child: Text(
                      "INICIAR CAMPEONATO",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                   
                    ref.watch(initialConfigProvider.notifier).create_championship();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
