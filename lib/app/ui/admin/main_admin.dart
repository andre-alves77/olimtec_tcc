import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/ui/admin/management/main_management.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modalities_page.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/main_privileges_admin.dart';


class MainAdmin extends ConsumerWidget {
  const MainAdmin({super.key});

  static String route = "/main-admin";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          ref.read(authRepositoryProvider).signOut();
                  },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
