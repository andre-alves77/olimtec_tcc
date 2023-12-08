import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:olimtec_tcc/app/models/game.dart';
import 'package:olimtec_tcc/app/shared/views/StartGame.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/cronograma_page.dart';
import 'dart:math';
import 'package:olimtec_tcc/app/ui/user/shared/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/ui/user/shared/resulttimeline_card.dart';

class DetailsGameOrganization extends StatefulWidget {
  const DetailsGameOrganization({super.key});

  static String route = "/detailsgame-organization";

  @override
  State<DetailsGameOrganization> createState() =>
      _DetailsGameOrganizationState();
}

class _DetailsGameOrganizationState extends State<DetailsGameOrganization> {
  Widget _rowInfo(String head, String info) {
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

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: FittedBox(
          child: Text(
            "3ºEAB VS 1ºEAB",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: sizeWidth / 1.2,
                        child: FittedBox(
                          child: Text(
                            "BASQUETE MASCULINO",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontFamily: 'Lato',
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ResultTimelineCard(gametest),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: sizeWidth / 1.8,
                          child: const FittedBox(
                            child: Text(
                              "INFORMAÇÕES",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: SizedBox(
                      width: sizeWidth / 2,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: const Color(0xFFEDEDED),
                        ),
                        child: const FittedBox(
                          child: Text(
                            "COMEÇAR JOGO",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {},
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Container(
                          width: sizeWidth / 2,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              children: <Widget>[
                                _rowInfo('LOCAL', 'QUADRA 01'),
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
                                _rowInfo('HORÁRIO', '8:45'),
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
                                _rowInfo('DATA', '01/08'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: sizeWidth / 2,
                          child: const FittedBox(
                            child: Text(
                              'OUTROS JOGOS',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView(children: [
                    GestureDetector(
                      //child: StartGame(game: gametest),
                      onTap: () {
                        Navigator.pushNamed(context, CronogramaUser.route);
                      },
                    ),
                    GestureDetector(
                      //child: StartGame(game: gametest),
                      onTap: () {
                        Navigator.pushNamed(context, CronogramaUser.route);
                      },
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
