import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';

class ManagementAccountAdd extends StatelessWidget {
  const ManagementAccountAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GERENCIAR CONTAS",
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
                            "/management_account",
                            Theme.of(context).colorScheme.primaryContainer,
                            "assets/images/LOGO_2DSB_EXAMPLE.png"),
                        Padding(padding: EdgeInsetsDirectional.all(8)),
                        CardItem(
                            "3ºEAA",
                            "",
                            Theme.of(context).colorScheme.primaryContainer,
                            "assets/images/LOGO_3EAA_EXAMPLE.png"),
                        Padding(padding: EdgeInsetsDirectional.all(8)),
                        CardItem(
                            "1ºEAB",
                            "",
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
