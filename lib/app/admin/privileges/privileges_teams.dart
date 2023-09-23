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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView(
              children: [
                
              ],
            )
          ],
        ),
      ),
    );
  }
}