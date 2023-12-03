import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/shared/views/StartGame.dart';
import 'package:olimtec_tcc/app/ui/shared/addgame_card.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/cronograma_page.dart';

import 'package:olimtec_tcc/app/ui/user/shared/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/ui/user/shared/resultado_page.dart';

class ModalityOrganization extends StatefulWidget {
  const ModalityOrganization({super.key});

  static String route = "/modalitypage-organization";

  @override
  State<ModalityOrganization> createState() => _ModalityOrganizationState();
}

class _ModalityOrganizationState extends State<ModalityOrganization>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final gamesRef = FirebaseFirestore.instance.collection('game');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: FittedBox(
            child: Text(
              "BASQUETE MASCULINO",
              style: TextStyle(
                fontFamily: 'Lato',
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: gamesRef.snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    if (data['gameState'] == "finalizado") {
                      print(data);
                    }
                  });
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                  );
                } else {
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      ...snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        if (data['gameState'] == "finalizado") {
                          print(data);
                        }
                        return SizedBox(
                          height: 0,
                          width: 0,
                        );
                      }).toList(),
                    ],
                  );
                }
              }),
            )
          ],
        ));
  }
}
