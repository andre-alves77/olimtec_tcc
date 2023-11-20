import 'dart:math';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';
import 'package:olimtec_tcc/app/ui/admin/management/management_account.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class LeaderTeamsPrivilegesAdmin extends StatelessWidget {
  const LeaderTeamsPrivilegesAdmin({super.key});

  static String route = "/leader-teams-privileges-admin";

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
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
                        CardItem(
                            "2ºDSB",
                            AppRoute.PRIVILEGESTEAMPAGE_ADMIN,
                            Theme.of(context).colorScheme.primaryContainer,
                            "assets/images/LOGO_2DSB_EXAMPLE.png"),
                        Padding(padding: EdgeInsetsDirectional.all(8)),
                        CardItem(
                            "3ºEAA",
                            AppRoute.PRIVILEGESTEAMPAGE_ADMIN,
                            Theme.of(context).colorScheme.primaryContainer,
                            "assets/images/LOGO_3EAA_EXAMPLE.png"),
                        Padding(padding: EdgeInsetsDirectional.all(8)),
                        CardItem(
                            "1ºEAB",
                            AppRoute.PRIVILEGESTEAMPAGE_ADMIN,
                            Theme.of(context).colorScheme.primaryContainer,
                            "assets/images/LOGO_1EAA_EXAMPLE.png"),
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
