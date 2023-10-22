import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/ui/admin/management/main_management.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modalities_page.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/main_privileges_admin.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class MainAdmin extends StatefulWidget {
  const MainAdmin({super.key});

  static String route = "/main-admin";

  @override
  State<MainAdmin> createState() => _MainAdminState();
}

class _MainAdminState extends State<MainAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ADMIN',
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
                  Navigator.pushNamed(context, MainPrivilegeAdmin.route);
                },
                child: OptionConfig(
                    icone: Icons.star,
                    text1: "PRIVILÉGIOS ",
                    text2: "(UNICOS DO ADMINISTRADOR)"),
              ),
              Padding(padding: EdgeInsets.all(15)),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MainManagementAdmin.route);
                  },
                  child: OptionConfig(
                      icone: Icons.library_books,
                      text1: "GERENCIAMENTO ",
                      text2: "(DE CADA MODALIDADE)"),
                ),
              ),
              Padding(padding: EdgeInsets.all(15)),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ModalitiesAdmin.route);
                },
                child: OptionConfig(
                    icone: Icons.sports_basketball,
                    text1: "MODALIDADES",
                    text2: "(TODAS AS MODALIDADES)"),
              ),
              Padding(padding: EdgeInsets.all(15)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
