import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/cronograma_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/equipe_page.dart';
import 'package:olimtec_tcc/app/ui/user/shared/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/ui/user/shared/resultado_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ModalityUser extends StatefulWidget {
  const ModalityUser({super.key});

  static String route = "/modality-user";

  @override
  State<ModalityUser> createState() => _ModalityUserState();
}

class _ModalityUserState extends State<ModalityUser>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _launchUrl(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: FittedBox(
          child: Text(
            "$arg",
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
                      ListView(
                        children: [
                          GestureDetector(
                            child: GameCard(gametest),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CronogramaUser.route);
                            },
                          ),
                          GestureDetector(
                            child: GameCard(gametest),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CronogramaUser.route);
                            },
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          GestureDetector(
                            child: GameCard(gametest),
                            onTap: () {
                              Navigator.pushNamed(context, ResultadoUser.route);
                            },
                          ),
                          GestureDetector(
                            child: GameCard(gametest),
                            onTap: () {
                              Navigator.pushNamed(context, ResultadoUser.route);
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
                              onPressed: () async {
                                var modalityId = "";
                                await FirebaseFirestore.instance
                                    .collection('modality')
                                    .where('name', isEqualTo: arg!)
                                    .get()
                                    .then((value) {
                                  modalityId = value.docs.first.id;
                                });
                                var link = "";

                                final firestoreRef = FirebaseFirestore.instance;
                                final docRef = await firestoreRef
                                    .collection('modality')
                                    .doc(modalityId)
                                    .get()
                                    .then((value) {
                                  link = value.get("rulesLing");
                                });
                                print(link);
                                try {
                                  await launch(link);
                                } catch (e) {
                                  print(e);
                                }
                              },
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
                                Navigator.pushNamed(context, EquipeUser.route);
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
      ),
    );
  }
}
