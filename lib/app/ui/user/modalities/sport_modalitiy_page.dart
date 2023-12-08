import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/service/game.service.dart';
import 'package:olimtec_tcc/app/features/test.dart';
import 'package:olimtec_tcc/app/features/user/chaveamentoCard.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/cronograma_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/equipe_page.dart';
import 'package:olimtec_tcc/app/ui/user/shared/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/ui/user/shared/resultado_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ModalityUser extends ConsumerWidget {
  const ModalityUser({super.key});

  static String route = "/modality-user";


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;
    List<String>? gameList = ref.watch(gamesDocORDERIdsProvider(arg!)).whenData((value) => value).value;
    List<Widget> widgetList = []; 
    gameList!.forEach((element) {
      widgetList.add(ChampionsCard(docId: element));
    });

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
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(children: widgetList,),
                  ),
                  const SizedBox(height: 10),
              ],
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
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           SizedBox(
              //             width: sizeWidth / 1.2,
              //             height: 50,
              //             child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                 backgroundColor:
              //                     Theme.of(context).colorScheme.primary,
              //                 shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(15)),
              //               ),
              //               onPressed: () {
              //                 Navigator.pushNamed(context, EquipeUser.route);
              //               },
              //               child: const FittedBox(
              //                 child: Text(
              //                   "VISUALIZAR SUA EQUIPE (2ºDSB)",
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 20,
              //                     fontFamily: 'Lato',
              //                     fontWeight: FontWeight.normal,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
