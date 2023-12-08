
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/service/team.service.dart';
import 'package:olimtec_tcc/app/features/test.dart';
import 'package:olimtec_tcc/app/shared/views/StartGame.dart';
import 'package:olimtec_tcc/app/ui/organization/game_score.dart';
import 'package:olimtec_tcc/app/ui/organization/scoreboard_without_points.dart';
import 'package:provider/provider.dart';

class StartGameCardStream extends StatelessWidget {
  const StartGameCardStream({super.key, required String this.docId});

  final String docId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('game')
            .doc(docId)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text('Erro ao carregar os dados do jogo');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Carregando");
          }
          if (snapshot.data == null) {
            return SizedBox(
              height: 0,
              width: 0,
            );
          }

          // Atualize o widget com os novos dados do jogo aqui
          print(snapshot.requireData.data());
          final game = snapshot.data!.data() as Map<String, dynamic>;

          return StartGame(game: game,);
        }

        // etc.
        //   return NewGameCard(game);
        );
  }
}



class StartGame extends ConsumerWidget {
  StartGame({
    super.key, required this.game
  });

Map<String, dynamic> game;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final teamImage1 = ref.watch(getTeamImage(game['team1']));
    final teamImage2 = ref.watch(getTeamImage(game['team2']));

    return Padding(
      padding: EdgeInsetsDirectional.all(8),
      child: Center(
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: sizeWidth,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          game['time'].toString(),
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: sizeWidth,
                    child: Divider(
                      height: 10,
                      thickness: 2,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: sizeWidth,
                      height: 1,
                      decoration:
                          BoxDecoration(), //colocar as cores nessas box decoration
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(imageUrl:teamImage1.value!,
                            width: sizeWidth / 8,
                            height: 60,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(7, 0, 5, 0),
                          child: Text(
                            game['team1'],
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Text(
                          'VS',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(7, 0, 5, 0),
                          child: Text(
                            game['team2'],
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(imageUrl:
 teamImage2.value!,
                            width: sizeWidth / 8,
                            height: 60,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: sizeWidth,
                    child: Divider(
                      height: 5,
                      thickness: 2,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'VER DETALHES',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: VerticalDivider(
                          width: 5,
                          thickness: 2,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      InkWell(
                        onTap: () async{

var mytime = await FirebaseFirestore.instance.collection('modality').where('name', isEqualTo: game['modalidade']).get().then((value) => value.docs.first.data());
                          if(mytime['scoreType'] != "Placar de números 1 a 100"){
                            Navigator.popAndPushNamed(context, ScoreBoardWithoutPoints.route);
                          }else{
                            Navigator.popAndPushNamed(context, GameScore.route);
                          }
                        },
                        child: Text(
                          'COMEÇAR JOGO',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
