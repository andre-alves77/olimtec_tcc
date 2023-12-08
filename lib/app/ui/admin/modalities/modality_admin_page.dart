import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modalities_equipes.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modalities_games.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/regulation_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/cronograma_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/modalities_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/sport_modalitiy_page.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class ModalityAdmin extends StatelessWidget {
  const ModalityAdmin({super.key});

  static String route = "/modality-admin";

  @override
  Widget build(BuildContext context) {
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;
    final gamesRef = FirebaseFirestore.instance
        .collection("modality")
        .where('name', isEqualTo: arg)
        .get()
        .then((value) => value);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$arg",
              style: TextStyle(
                fontFamily: 'Lato',
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Column(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, TeamAdmin.route,  arguments: arg);
                  //   },
                  //   child: OptionConfig(
                  //       icone: Icons.shield_outlined,
                  //       text1: "VISUALIZAR EQUIPES",
                  //       text2: "(PARTICIPANTES)"),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ModalitiesGamesAdmin.route);
                    },
                    child: OptionConfig(
                        icone: Icons.remove_red_eye, text1: "VISUALIZAR JOGOS"),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, RegulationAdmin.route);
                  //   },
                  //   child: OptionConfig(
                  //       icone: Icons.rule, text1: "VISUALIZAR REGULAMENTO"),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, ModalitiesUser.route);
                  //   },
                  //   child: OptionConfig(
                  //       icone: Icons.account_tree,
                  //       text1: "VISUALIZAR CHAVEAMENTO"),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
