import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';

class TeamAdmin extends StatelessWidget {
  const TeamAdmin({super.key});

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
                              "/team_view_admin",
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_2DSB_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "3ºEAA",
                              "/team_view_admin",
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_3EAA_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "1ºEAB",
                              "/team_view_admin",
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_1EAA_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "2ºDSB",
                              "/team_view_admin",
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_2DSB_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "3ºEAA",
                              "/team_view_admin",
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_3EAA_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "1ºEAB",
                              "/team_view_admin",
                              Theme.of(context).colorScheme.primaryContainer,
                              "assets/images/LOGO_1EAA_EXAMPLE.png"),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                          CardItem(
                              "2ºDSB",
                              "/team_view_admin",
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
