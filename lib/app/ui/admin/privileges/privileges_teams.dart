import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/CardItem.dart';


class PrivilegesTeam extends StatefulWidget {
  const PrivilegesTeam({super.key});

  @override
  State<PrivilegesTeam> createState() => _PrivilegesTeamState();
}

class _PrivilegesTeamState extends State<PrivilegesTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "REPRESENTANTES",
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
                    Column(
                      children: [
                        CardItem("2ºDSB", "/privileges_team_page", Theme.of(context).colorScheme.primaryContainer, "assets/images/LOGO_2DSB_EXAMPLE.png"),
                        Padding(padding: EdgeInsetsDirectional.all(8)),
                        CardItem("3ºEAA", "", Theme.of(context).colorScheme.primaryContainer, "assets/images/LOGO_3EAA_EXAMPLE.png"),
                        Padding(padding: EdgeInsetsDirectional.all(8)),
                        CardItem("1ºEAB", "", Theme.of(context).colorScheme.primaryContainer, "assets/images/LOGO_1EAA_EXAMPLE.png"),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}