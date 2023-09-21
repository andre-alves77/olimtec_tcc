import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/option_config.dart';

class MainAdmin extends StatefulWidget {
  const MainAdmin({super.key});

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
              OptionConfig(Icons.star, "PRIVILÉGIOS ", "(UNICOS DO ADMINISTRADOR)"),
              Padding(padding: EdgeInsets.all(15)),
              OptionConfig(Icons.library_books, "GERENCIAMENTO ", "(DE CADA MODALIDADE)"),
              Padding(padding: EdgeInsets.all(15)),
              OptionConfig(Icons.sports_basketball, "JOGOS     ", "(DE CADA MODALIDADE)"),
              Padding(padding: EdgeInsets.all(15)),
              OptionConfig(Icons.settings, "CONFIGURAÇÕES ", "(GERAIS DAS OLÍMPIADAS)"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context, '/', (route) => false
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}