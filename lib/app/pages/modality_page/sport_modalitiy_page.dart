import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/components/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/pages/modality_page/result_card.dart';

class SportModalityPage extends StatefulWidget {
  const SportModalityPage({super.key});

  @override
  State<SportModalityPage> createState() => _SportModalityPageState();
}

class _SportModalityPageState extends State<SportModalityPage>
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 15),
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
                height: 300,
                constraints: BoxConstraints(maxWidth: 400),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView(
                      children: [
                        InkWell(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                      ],
                    ),
                    ListView(
                      children: [
                        GameCard(gametest),
                        GameCard(gametest),
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
                                "REGULAMENTO",
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/equipe_page');
                            },
                            child: const FittedBox(
                              child: Text(
                                "VISUALIZAR SUA EQUIPE (2ºDSB)",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
