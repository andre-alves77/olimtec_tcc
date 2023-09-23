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
                        CardItem("2ºDSB", "/", Theme.of(context).colorScheme.primaryContainer, "assets/images/LOGO_2DSB_EXAMPLE.png"),
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