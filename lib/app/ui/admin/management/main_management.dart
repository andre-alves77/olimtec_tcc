import 'package:flutter/material.dart';
import 'dart:math';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/ui/admin/management/management_account_add.dart';
import 'package:olimtec_tcc/app/ui/admin/management/restart_champioship.dart';

class MainManagementAdmin extends StatelessWidget {
  const MainManagementAdmin({super.key});

  static String route = "/mainamanagement-admin";

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'GERENCIAMENTO',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                    // child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.pushNamed(
                    //           context, ManagementAccountAddAdmin.route);
                    //     },
                    //     child: OptionConfig(
                    //         icone: Icons.manage_accounts,
                    //         text1: 'GERENCIAR CONTAS')),
                    ),
              ),
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RestartChampioshipAdmin.route);
                    },
                    child: OptionConfig(
                        icone: Icons.emoji_events,
                        text1: 'REINICIAR CAMPEONATO')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
