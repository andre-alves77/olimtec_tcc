import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class MainOrgnization extends StatefulWidget {
  const MainOrgnization({super.key});

  static String route = "/main-organization";

  @override
  State<MainOrgnization> createState() => _MainOrgnizationState();
}

class _MainOrgnizationState extends State<MainOrgnization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ORGANIZAÇÃO',
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
                  Navigator.pushNamed(context, AppRoute.ADDGAME_ORGANIZATION);
                },
                child: OptionConfig(
                    icone: Icons.add,
                    text1: "ADICIONAR JOGOS ",
                    text2: "(CRONOGRAMA DO CHAVEAMENTO)"),
              ),
              Padding(padding: EdgeInsets.all(15)),
              OptionConfig(
                  icone: Icons.mode,
                  text1: "MODIFICAR REGULAMENTO ",
                  text2: "(DE CADA MODALIDADE)"),
              Padding(padding: EdgeInsets.all(15)),
              OptionConfig(
                  icone: Icons.add_photo_alternate_outlined,
                  text1: "ADICIONAR MÍDIA ",
                  text2: "(DE CADA MODALIDADE)"),
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
