import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/ui/team/shared/modality_item.dart';

class TeamModality extends StatefulWidget {
  const TeamModality({super.key});

  @override
  State<TeamModality> createState() => _TeamModalityState();
}

class _TeamModalityState extends State<TeamModality> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CADASTRO DE EQUIPES",
          style: TextStyle(
              fontFamily: 'Lato', fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: sizeWidth / 1.2,
                        child: const FittedBox(
                          child: Text(
                            "CLIQUE NA MODALIDADE E INSIRA",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: sizeWidth / 1.2,
                        child: FittedBox(
                          child: Text(
                            "OS ALUNOS DA SUA SALA NAS EQUIPES",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: 'Lato',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: sizeWidth / 1.8,
                    child: const FittedBox(
                      child: Text(
                        "ESPORTES DE QUADRA",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: ListView(
                  children: [
                    ModalityItem(Icons.sports_basketball, "BASQUETE MASCULINO"),
                    ModalityItem(Icons.sports_basketball, "BASQUETE FEMININO"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
