import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/ui/team/shared/modality_item.dart';
import 'package:olimtec_tcc/app/features/admin/privileges/leader/view/team_players.dart';

class ModalityTeam extends StatefulWidget {
  const ModalityTeam({super.key});

  static String route = "/modality-team";

  @override
  State<ModalityTeam> createState() => _ModalityTeamState();
}

class _ModalityTeamState extends State<ModalityTeam> {
  @override
  Widget build(BuildContext context) {
    final modalitiesRef = FirebaseFirestore.instance.collection('modality');
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
            child: ListView(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'INSIRA OS ALUNOS',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontFamily: 'Lato',
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NAS MODALIDADES ABAIXO',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontFamily: 'Lato',
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                StreamBuilder<QuerySnapshot>(
                  stream: modalitiesRef.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      );
                    } else {
                      return ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ESPORTE DE QUADRA',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontFamily: 'Lato',
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          ...snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            if (data['category'] == "quadra") {
                              return ModalityItem(
                                routesArg: data['name'],
                                routes: PlayerTeam.route,
                                modalityName: data['name'],
                                iconName: data['icon'],
                              );
                            }
                            return SizedBox(
                              height: 0,
                              width: 0,
                            );
                          }).toList(),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'DANÇA',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontFamily: 'Lato',
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          ...snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            if (data['category'] == "dança") {
                              return ModalityItem(
                                routesArg: data['name'],
                                routes: PlayerTeam.route,
                                modalityName: data['name'],
                                iconName: data['icon'],
                              );
                            }
                            return SizedBox(
                              height: 0,
                              width: 0,
                            );
                          }).toList(),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'JOGOS DE MESA',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontFamily: 'Lato',
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          ...snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            if (data['category'] == "jogos de mesa") {
                              return ModalityItem(
                                routesArg: data['name'],
                                routes: PlayerTeam.route,
                                modalityName: data['name'],
                                iconName: data['icon'],
                              );
                            }
                            return SizedBox(
                              height: 0,
                              width: 0,
                            );
                          }).toList(),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'E-SPORTS',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontFamily: 'Lato',
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          ...snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            if (data['category'] == "e-sports") {
                              return ModalityItem(
                                routesArg: data['name'],
                                routes: PlayerTeam.route,
                                modalityName: data['name'],
                                iconName: data['icon'],
                              );
                            }
                            return SizedBox(
                              height: 0,
                              width: 0,
                            );
                          }).toList(),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'OUTROS',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontFamily: 'Lato',
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          ...snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            if (data['category'] == "outros") {
                              return ModalityItem(
                                routesArg: data['name'],
                                routes: PlayerTeam.route,
                                modalityName: data['name'],
                                iconName: data['icon'],
                              );
                            }
                            return SizedBox(
                              height: 0,
                              width: 0,
                            );
                          }).toList(),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
