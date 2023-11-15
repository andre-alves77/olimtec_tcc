import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modality_team_view.dart';

class TeamAdmin extends StatelessWidget {
  const TeamAdmin({super.key});

  static String route = "/team-admin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BASQUETE MASC.EQUIPES",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          CardItem(
                              "2ºDSB",
                              TeamViewAdmin.route,
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_2DSB_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "3ºEAA",
                              TeamViewAdmin.route,
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_3EAA_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "1ºEAB",
                              TeamViewAdmin.route,
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_1EAA_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "2ºDSB",
                              TeamViewAdmin.route,
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_2DSB_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "3ºEAA",
                              TeamViewAdmin.route,
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_3EAA_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "1ºEAB",
                              TeamViewAdmin.route,
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_1EAA_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "2ºDSB",
                              TeamViewAdmin.route,
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_2DSB_EXAMPLE.png"),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
