import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';

import 'package:olimtec_tcc/app/features/championship/service/game.service.dart';
import 'package:olimtec_tcc/app/features/championship/service/team.service.dart';
import 'package:olimtec_tcc/app/features/user/chaveamentoCard.dart';

import 'package:olimtec_tcc/app/ui/user/modalities/cronograma_page.dart';

class GamesScreen extends ConsumerWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
      ),
      body: ref.watch(inProgressGamesProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text(err.toString())),
            data: (games) {
              return ListView.builder(
                itemCount: games.length,
                itemBuilder: (_, index) {
                  return GameCardStream(docId: games[index]);
                },
              );
            },
          ),
    );
  }
}

class GameCardStream extends StatelessWidget {
  const GameCardStream({super.key, required String this.docId});

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

          return NewGameCard(game, docId);
        }

        // etc.
        //   return NewGameCard(game);
        );
  }
}

class ChampionsCard extends StatelessWidget {
  const ChampionsCard({super.key, required String this.docId});

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

          return ChaveamentoCard(game, docId);
        }

        // etc.
        //   return NewGameCard(game);
        );
  }
}

class NewGameCard extends ConsumerWidget {
  NewGameCard(this.game, this.docId, {super.key});

  final String docId;

  final Map<String, dynamic>
      game; //Dentro desse map que vem do banco, vai ser game['team1']

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamImage1 = ref.watch(getTeamImage(game['team1'])).value;

    final teamImage2 = ref.watch(getTeamImage(game['team2'])).value;

    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    if (teamImage2 is String && teamImage1 is String)
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, CronogramaUser.route, arguments: docId);
        },
        child: AspectRatio(
          aspectRatio: 2.8,
          child: Card(
            margin: EdgeInsets.all(10),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              width: sizeWidth,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Row(
                            children: [
                              Text(
                                game["modalidade"],
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 17.8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(' - '),
                              Text(
                                game["time"],
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 17.8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: FittedBox(
                        child: Container(
                          width: 330,
                          child: Divider(
                            height: 1,
                            thickness: 2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: CachedNetworkImage(
                                imageUrl: teamImage1,
                                width: sizeWidth / 6,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              game["team1"],
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 6.5),
                                width: 100,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${game['teamPts1'].toString()} X ${game['teamPts2'].toString()}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: game['gameState'] == "predicted"
                                      ? Text(
                                          'Previsto',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer),
                                        )
                                      : game['gameState'] == "inProgress"
                                          ? Text(
                                              '• Em andamento',
                                              style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.redAccent),
                                            )
                                          : Text(
                                              'Encerrado',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: teamImage2,
                                  width: sizeWidth / 6,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                game["team2"],
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    return AspectRatio(
      aspectRatio: 2.8,
      child: Card(
        margin: EdgeInsets.all(10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          width: sizeWidth,
          child: FittedBox(
              fit: BoxFit.contain,
              child: Center(
                child: CircularProgressIndicator(),
              )),
        ),
      ),
    );
  }
}

final getModalitiesProvider = FutureProvider((ref) async {
  try {
    Future<List<String>> _getModalities() async {
      List<String> fieldValues = [];

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("modality").get();
      for (var doc in querySnapshot.docs) {
        fieldValues.add(doc["category"]);
      }
      return fieldValues;
    }

    return _getModalities();
  } catch (e) {
    CustomSnackBar(message: 'Error', ref: ref);
  }
});
