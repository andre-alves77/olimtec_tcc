import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/features/championship/views/initial_config/add_teams.dart';
import 'package:olimtec_tcc/app/ui/champioship_page.dart';

class StartChampionshipAdmin extends StatelessWidget {
  const StartChampionshipAdmin({super.key});

  static String route = "/startchampionship-admin";

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        automaticallyImplyLeading: false,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            Theme.of(context).brightness == Brightness.light
                ? 'assets/images/LOGO_LIGHT_MODE.png'
                : 'assets/images/LOGO_DARK_MODE.png',
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          "INICIAR OLÍMPIADAS",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "BEM-VINDO AO OLIM",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "TEC",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.light
                      ? 'assets/images/LOGO_LIGHT_MODE.png'
                      : 'assets/images/LOGO_DARK_MODE.png',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "OLIM",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "TEC",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Text(
                "DÊ INICÍO AO MAIOR EVENTO DE ESPORTE",
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              Text(
                "DA ETEC JARDIM ÂNGELA ABAIXO:",
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              SizedBox(
                width: sizeWidth / 1.3,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: const Color(0xFFEDEDED),
                  ),
                  child: FittedBox(
                    child: Text(
                      "INICIAR OLÍMPIADAS",
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, ChampioshipPageAdmin.route);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
