import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/Privilege_item.dart';
import 'package:olimtec_tcc/app/features/admin/privileges/leader/view/leader_teams_privileges.dart';
import 'package:olimtec_tcc/app/features/admin/privileges/organization/view/organization_teams_privileges%20copy.dart';
import 'package:olimtec_tcc/app/features/admin/privileges/leader/view/privilege_team_page.dart';
import 'package:olimtec_tcc/app/features/admin/privileges/organization/view/privilge_organization_page.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class MainPrivilegeAdmin extends StatefulWidget {
  const MainPrivilegeAdmin({super.key});

  static String route = "/mainprivilegeAdmin-admin";

  @override
  State<MainPrivilegeAdmin> createState() => _MainPrivilegeAdminState();
}

class _MainPrivilegeAdminState extends State<MainPrivilegeAdmin> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PRIVILÉGIOS",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: sizeWidth / 1.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrivilegeOption(
                Icons.switch_account_rounded,
                "REPRESENTANTES",
               LeaderTeamsPrivilegesAdmin.route,
              ),
              PrivilegeOption(
                Icons.people,
                "ORGANIZADORES",
                OrganizationTeamsPrivilegesAdmin.route,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
