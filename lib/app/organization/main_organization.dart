

import 'package:flutter/material.dart';

import '../shared/option_config.dart';

class MainOrgnization extends StatefulWidget {
  const MainOrgnization({super.key});

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
              OptionConfig(Icons.add, "ADICIONAR JOGOS ", "(CRONOGRAMA DO CHAVEAMENTO)"),
              Padding(padding: EdgeInsets.all(15)),
              OptionConfig(Icons.mode, "MODIFICAR REGULAMENTO ", "(DE CADA MODALIDADE)"),
              Padding(padding: EdgeInsets.all(15)),
              OptionConfig(Icons.add_photo_alternate_outlined, "ADICIONAR MÍDIA ", "(DE CADA MODALIDADE)"),
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