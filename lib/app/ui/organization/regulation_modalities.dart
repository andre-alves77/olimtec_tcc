import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modality_admin_page.dart';
import 'package:olimtec_tcc/app/features/organization/add_games/adicionar_jogo.dart';
import 'package:olimtec_tcc/app/ui/organization/insert_modality_rule_org.dart';
import 'package:olimtec_tcc/app/ui/shared/modalityItem_card.dart';


class RegulationModalitiesOrganization extends StatelessWidget {
  const RegulationModalitiesOrganization({super.key});

  static String route = "/regulationModalities-organization";

  @override
  Widget build(BuildContext context) {
    final modalitiesRef = FirebaseFirestore.instance.collection('modality');
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'MODALIDADES',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          alignment: Alignment.topCenter,
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
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
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['category'] == "quadra") {
                            return ModalityItemCard(
                              routesArg: data['name'],
                              routes: InsertRuleOrganization.route,
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
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['category'] == "dança") {
                            return ModalityItemCard(
                              routesArg: data['name'],
                              routes: InsertRuleOrganization.route,
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
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['category'] == "jogos de mesa") {
                            return ModalityItemCard(
                               routesArg: data['name'],
                              routes: InsertRuleOrganization.route,
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
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['category'] == "e-sports") {
                            return ModalityItemCard(
                               routesArg: data['name'],
                              routes: InsertRuleOrganization.route,
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
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['category'] == "outros") {
                            return ModalityItemCard(
                               routesArg: data['name'],
                              routes: InsertRuleOrganization.route,
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
      ),
    );
  }
}
