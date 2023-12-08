import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/service/team.service.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/cronograma_page.dart';

class ChaveamentoCard extends ConsumerWidget {
  ChaveamentoCard(this.game, {super.key});

  final Map<String, dynamic>
      game; //Dentro desse map que vem do banco, vai ser game['team1']

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var teamImage1 = null;

    var teamImage2 = null;

    if(game['team1'] == null || game['team2'] == null) {
        teamImage1 = null;

     teamImage2 = null;
    } else {
       teamImage1 = ref.watch(getTeamImage(game['team1'])).value;

     teamImage2 = ref.watch(getTeamImage(game['team2'])).value;
    }
   


    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, CronogramaUser.route);
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
                              Text("N°: ",
                              style: TextStyle(
                                 fontFamily: 'Lato',
                                    fontSize: 17.8,
                                    fontWeight: FontWeight.bold,
                              ),
                              ),
                             Padding(
                               padding: const EdgeInsets.only(right: 20),
                               child: Text(
                                game["id"].toString(),
                                style: TextStyle(
                                   fontFamily: 'Lato',
                                    fontSize: 17.8,
                                    fontWeight: FontWeight.bold,
                                ),
                               ),
                             ),

                              Text(
                                game["modalidade"]?? 'modalidade',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 17.8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(' - '),
                              Text(
                                game["local"]?? "A definir",
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
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: teamImage1 ?? '',
                                width: sizeWidth / 6,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              game["team1"] ?? 'time1',
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
                                          : game['gameState'] == "predicted"? Text(
                                              'Não configurado',
                                              style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.redAccent),
                                            ) : Text(
                                              'Encerrado',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                            Text("Round:",
                                            style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 17.8,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          ),
                                            
                                           Text(
                                            game["round"].toString() ?? '0',
                                            style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 17.8,
                                            fontWeight: FontWeight.bold,
                                          ),
                                           )
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
                                  imageUrl: teamImage2 ?? '',
                                  width: sizeWidth / 6,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                game["team2"] ?? 'time2',
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