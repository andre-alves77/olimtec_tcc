import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/championship/service/game.service.dart';
import 'package:olimtec_tcc/app/features/championship/service/team.service.dart';
import 'package:olimtec_tcc/app/shared/views/loading_page.dart';

class GameScore extends ConsumerStatefulWidget {
  const GameScore({super.key});
  static String route = "/gamescore-organization";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameScoreState();
}

Widget _rowzinha(String head, String info) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      FittedBox(
        child: Text(
          "$head - ",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      FittedBox(
        child: Text(
          info,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
            fontFamily: 'Lato',
          ),
        ),
      )
    ],
  );
}

class _GameScoreState extends ConsumerState<GameScore> {
  int counter = 0;
  int time2 = 0;
  int foulsTime1 = 0;
  int foulsTime2 = 0;

  void _incrementCounter(String docId) async {
    try {
      counter++;
      await FirebaseFirestore.instance
          .collection('game')
          .doc(docId)
          .update({'teamPts1': counter});
      setState(() {});
    } catch (e) {
      throw CustomSnackBar(message: 'Ocorreu um erro', ref: ref);
    }
  }

  void _decrementCounter(String docId) async {
    try {
      counter--;
      await FirebaseFirestore.instance
          .collection('game')
          .doc(docId)
          .update({'teamPts1': counter});
      setState(() {});
    } catch (e) {
      throw CustomSnackBar(message: 'Ocorreu um erro', ref: ref);
    }
  }

  void _incrementTime2(String docId) async {
    try {
      time2++;
      await FirebaseFirestore.instance
          .collection('game')
          .doc(docId)
          .update({'teamPts2': time2});
      setState(() {});
    } catch (e) {
      throw CustomSnackBar(message: 'Ocorreu um erro', ref: ref);
    }
  }

  void _decrementTime2(String docId) async {
    try {
    time2--;
      await FirebaseFirestore.instance
          .collection('game')
          .doc(docId)
          .update({'teamPts2': time2});
      setState(() {});
    } catch (e) {
      throw CustomSnackBar(message: 'Ocorreu um erro', ref: ref);
    }
  }

  void _incrementFoulsTime1() {
    setState(() {
     foulsTime1++;
    });
  }

  void _decrementFoulsTime1() {
    setState(() {
     foulsTime1--;
    });
  }

  void _incrementFoulsTime2() {
    setState(() {
      foulsTime2++;
    });
  }

  void _decrementFoulsTime2() {
    setState(() {
      foulsTime2--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final String? argModality =
        ModalRoute.of(context)?.settings.arguments as String;
    final data = ref.watch(gameStreamProvider(argModality!)).value;
      int counter = data!['teamPts1'];
  time2 =  data['teamPts2'];


    final teamImage1 = ref.watch(getTeamImage(data!['team1'])).value ??
        'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36';
    final teamImage2 = ref.watch(getTeamImage(data!['team2'])).value ??
        'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36';

    if (data == null) return LoadingPage();
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            "${data['team1']} X ${data['team2']}",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['modalidade'],
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FittedBox(
                child: Container(
                  width: 382,
                  height: 440,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'PONTUAÇÃO',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 362,
                            height: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: CachedNetworkImage(
                                    imageUrl: teamImage1,
                                    width: 110,
                                    height: 110,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 0, 10, 0),
                                  child: Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'VS',
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 28,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 22),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(80),
                                        child: CachedNetworkImage(
                                          imageUrl: teamImage2,
                                          width: 100,
                                          height: 110,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              data['team1'],
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Em andamento',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              data['team2'],
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 105,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      _decrementCounter(argModality);
                                    },
                                  ),
                                  AnimatedOpacity(
                                    opacity: counter != 0 ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 500),
                                    child: Text(
                                      '$counter',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      _incrementCounter(argModality);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              child: VerticalDivider(
                                width: 5,
                                thickness: 2,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                            Container(
                              width: 105,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      _decrementTime2(argModality);
                                    },
                                  ),
                                  AnimatedOpacity(
                                    opacity: time2 != 0 ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 500),
                                    child: Text(
                                      '$time2',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      _incrementTime2(argModality);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 2,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'QUANTIDADE DE FALTAS',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 105,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: _decrementFoulsTime1,
                                  ),
                                  AnimatedOpacity(
                                    opacity: foulsTime1 != 0 ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 500),
                                    child: Text(
                                      '$foulsTime1',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: _incrementFoulsTime1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              child: VerticalDivider(
                                width: 5,
                                thickness: 2,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                            Container(
                              width: 105,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: _decrementFoulsTime2,
                                  ),
                                  AnimatedOpacity(
                                    opacity: foulsTime2 != 0 ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 500),
                                    child: Text(
                                      '$foulsTime2',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: _incrementFoulsTime2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 2,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //     Row(
                          //       children: [
                          //         Text(
                          //           'TEMPO: 00:00',
                          //           style: TextStyle(
                          //             fontFamily: 'Lato',
                          //             fontSize: 26,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     IconButton(
                          //       autofocus: true,
                          //       focusColor: Theme.of(context).colorScheme.primary,
                          //       hoverColor: Theme.of(context).colorScheme.primary,
                          //       onPressed: () {},
                          //       icon: Icon(
                          //         Icons.pause,
                          //         color: Theme.of(context)
                          //             .colorScheme
                          //             .primaryContainer,
                          //         size: 50,
                          //       ),
                          //     ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Container(
                          width: 260,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.error,
                          ),
                          child: TextButton(
                            onPressed: () async {
//await FirebaseFirestore.instance.collection('game').doc(argModality).update({'gameState':"finished"});

                              String nextgameDocId = '';
                              Map<String, dynamic>? nextGameData;
                              try {

                                
                                if (data['isfinal'] == true) {
                                  await FirebaseFirestore.instance
                                      .collection('game')
                                      .doc(argModality)
                                      .update({'gameState': 'finished'});
                                  Navigator.pop(context);
                                }

                                if (counter > time2) {
                                  await FirebaseFirestore.instance
                                      .collection('game')
                                      .doc(argModality)
                                      .update({'winner': data['team1']});
                                  await FirebaseFirestore.instance
                                      .collection('game')
                                      .where("modalidade",
                                          isEqualTo: data['modalidade'])
                                      .where('id', isEqualTo: data['nextGame'])
                                      .get()
                                      .then((value) => value.docs.first.id)
                                      .then((value) {
                                    nextgameDocId = value;
                                  });
                                  await FirebaseFirestore.instance
                                      .collection('game')
                                      .where("modalidade",
                                          isEqualTo: data['modalidade'])
                                      .where('id', isEqualTo: data['nextGame'])
                                      .get()
                                      .then((value) => value.docs.first.data())
                                      .then((value) {
                                    nextGameData = value;
                                  });
                                  print("opa");

                                  if (nextGameData!['team1'] == null) {
                                    await FirebaseFirestore.instance
                                        .collection('game')
                                        .doc(nextgameDocId)
                                        .update({'team1': data['team1']});
                                  } else {
                                    await FirebaseFirestore.instance
                                        .collection('game')
                                        .doc(nextgameDocId)
                                        .update({'team2': data['team1']});
                                  }
                                } else if (counter <time2) {
                                  await FirebaseFirestore.instance
                                      .collection('game')
                                      .doc(argModality)
                                      .update({'winner': data['team2']});
                                  await FirebaseFirestore.instance
                                      .collection('game')
                                      .where("modalidade",
                                          isEqualTo: data['modalidade'])
                                      .where('id', isEqualTo: data['nextGame'])
                                      .get()
                                      .then((value) => value.docs.first.id)
                                      .then((value) {
                                    nextgameDocId = value;
                                  });
                                  await FirebaseFirestore.instance
                                      .collection('game')
                                      .where("modalidade",
                                          isEqualTo: data['modalidade'])
                                      .where('id', isEqualTo: data['nextGame'])
                                      .get()
                                      .then((value) => value.docs.first.data())
                                      .then((value) {
                                    nextGameData = value;
                                  });

                                  if (nextGameData!['team1'] == null) {
                                    await FirebaseFirestore.instance
                                        .collection('game')
                                        .doc(nextgameDocId)
                                        .update({'team1': data['team2']});
                                  } else {
                                    await FirebaseFirestore.instance
                                        .collection('game')
                                        .doc(nextgameDocId)
                                        .update({'team2': data['team2']});
                                  }
                                }else if(counter == time2){
                                  CustomSnackBar(message: 'EMPATE NÃO FUNCIONA', ref: ref);
                                }
                                await FirebaseFirestore.instance
                                    .collection('game')
                                    .doc(argModality)
                                    .update({'gameState': 'finished'});

                                Navigator.pop(context);
                              } catch (e) {
                                print(e.toString());
                              }
//                                 if(_counter > _time2){
// await FirebaseFirestore.instance.collection('game').doc(argModality).update({'winner':data['team1']});
// ref.watch(getTeam2([data['modalidade'], data['nextGame']])).whenData((value) async {

// await FirebaseFirestore.instance.collection('game').doc(value).get().then((value2)async {
//   var my = value2.data()!['team1'];
//   print('oaa');

//   if(my == null){
// await FirebaseFirestore.instance.collection('game').doc().update({'team1':data['team1']});

//   }else{
// await FirebaseFirestore.instance.collection('game').doc().update({'team2':data['team1']});

//   }
// });

//  });

// }else{
// await FirebaseFirestore.instance.collection('game').doc(argModality).update({'winner':data['team2']});
// ref.watch(getTeam2([data['modalidade'], data['nextGame']])).whenData((value) async {

// await FirebaseFirestore.instance.collection('game').doc(value).get().then((value2)async {
//   print('MINHA BOLA');
//   var my = value2.data()!['team1'];
//   print('oaa');

//   if(my == null){
// await FirebaseFirestore.instance.collection('game').doc(value).update({'team1':data['team2']});

//   }else{
// await FirebaseFirestore.instance.collection('game').doc(value).update({'team2':data['team2']});

//   }
// });
// });

//                                 }
                            },
                            child: Text(
                              'FINALIZAR JOGO',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  'INFORMAÇÕES',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: FittedBox(
                  child: Container(
                    width: sizeWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Container(
                      width: sizeWidth / 2,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          children: <Widget>[
                            _rowzinha('LOCAL', data['local']),
                            SizedBox(
                              width: sizeWidth,
                              child: Divider(
                                height: 2,
                                thickness: 1,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                            _rowzinha('HORÁRIO', data['time']),
                            SizedBox(
                              width: sizeWidth,
                              child: Divider(
                                height: 2,
                                thickness: 1,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                            _rowzinha('DATA', data['date']),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
