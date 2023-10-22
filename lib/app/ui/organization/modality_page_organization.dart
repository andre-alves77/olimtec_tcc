import 'dart:math';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/models/team.dart';
import 'package:olimtec_tcc/app/shared/views/StartGame.dart';

import 'package:olimtec_tcc/app/ui/user/shared/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';

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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: const Alignment(0, 0),
                  child: Container(
                    width: sizeWidth / 1,
                    child: FittedBox(
                      child: TabBar(
                        isScrollable: true,
                        tabs: const [
                          Tab(
                            text: 'CRONOGRAMA',
                          ),
                          Tab(
                            text: 'RESULTADOS',
                          )
                        ],
                        controller: _tabController,
                        labelColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        unselectedLabelColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        labelStyle: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        indicatorWeight: 3,
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 400, maxHeight: 300),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListView(
                          children: [
                            GestureDetector(
                              child: StartGame(game: gametest),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/cronograma_page');
                              },
                            ),
                            GestureDetector(
                              child: StartGame(game: gametest),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/cronograma_page');
                              },
                            ),
                          ],
                        ),
                      ),
                      ListView(
                        children: [
                          GestureDetector(
                            child: GameCard(gametest),
                            onTap: () {
                              Navigator.pushNamed(context, '/resultado_page');
                            },
                          ),
                          GestureDetector(
                            child: GameCard(gametest),
                            onTap: () {
                              Navigator.pushNamed(context, '/resultado_page');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Container(
                          width: sizeWidth / 2,
                          child: FittedBox(
                            child: Text(
                              "Chaveamento",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontFamily: "Lato",
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: sizeWidth / 1.2,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[400],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () {},
                              child: const FittedBox(
                                child: Text(
                                  "VER REGULAMENTO",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
