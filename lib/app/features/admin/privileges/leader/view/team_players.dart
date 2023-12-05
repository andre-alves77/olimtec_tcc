import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/firebase/team.dart';
import 'package:olimtec_tcc/app/ui/team/add_player.dart';
import 'package:olimtec_tcc/app/ui/team/shared/card_jogador.dart';

class PlayerTeam extends ConsumerWidget {
  const PlayerTeam({super.key});

  static String route = "/player-team";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;
    final appuser = ref.watch(appUserStream).when(data: (data) {
      return data;
    }, error: (error, stackTrace) {
      CustomSnackBar(
          message: "Um erro aconteceu. Tente novamente",
          ref: ref,
          type: ScaffoldAlert.error);
      return null;
    }, loading: () {
      return null;
    });

    final teamImage =
        ref.watch(teamNameStream(appuser!.teamName)).whenOrNull(data: (data) {
      if (data != null) return data;
      return "minha bola";
    });

    final usersRef = FirebaseFirestore.instance
        .collection('users')
        .where('teamName', isEqualTo: appuser.teamName)
        .snapshots();

    final teamRef = FirebaseFirestore.instance
        .collection('team')
        .where('team', isEqualTo: appuser.teamName)
        .snapshots();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'EQUIPES',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '$arg',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                  FittedBox(
                    child: Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                            imageUrl: teamImage!,
                            width: 170,
                            height: 170,
                            fit: BoxFit.fitHeight,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.shield, size: 200)),
                      ),
                    ),
                  ),
                  Text(
                    'Máximo de participantes: 9',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
              FittedBox(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'PARTICIPANTES',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 2,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  constraints: BoxConstraints(maxWidth: sizeWidth),
                  height: 400,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: usersRef,
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
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;
                              return Column(
                                children: [
                                  CardJogador(
                                    text: data['name'],
                                    image: data['avatar'],
                                  ),
                                  Divider(
                                      height: 2,
                                      thickness: 1.5,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
                                  Padding(
                                      padding: EdgeInsetsDirectional.all(8)),
                                ],
                              );
                            }).toList(),
                          );
                        }
                      }),
                ),
              ),
            ])));
  }
}
