// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:olimtec_tcc/app/features/championship/models/game.dart';

<<<<<<< HEAD

// class StartGame extends StatelessWidget {
//   String horario = 'HORÁRIO:';
//   StartGame({
//     super.key,
//     required this.game,
//   });

//   final Game game;

//   @override
//   Widget build(BuildContext context) {
//     final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

//     return Padding(
//       padding: EdgeInsetsDirectional.all(8),
//       child: Center(
//         child: Expanded(
//           child: Card(
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             elevation: 10,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Container(
//               width: sizeWidth,
//               height: 175,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primaryContainer,
//                 borderRadius: BorderRadius.circular(20),
//                 shape: BoxShape.rectangle,
//                 border: Border.all(
//                   width: 2,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Flexible(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             "$horario  " + game.time!,
//                             style: TextStyle(
//                               fontFamily: 'Lato',
//                               fontSize: 22,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: sizeWidth,
//                       child: Divider(
//                         height: 10,
//                         thickness: 2,
//                         color: Theme.of(context).colorScheme.onPrimaryContainer,
//                       ),
//                     ),
//                     Flexible(
//                       child: Container(
//                         width: sizeWidth,
//                         height: 1,
//                         decoration:
//                             BoxDecoration(), //colocar as cores nessas box decoration
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(50),
//                             child: Image.asset(
//                               game.team1!.image,
//                               width: sizeWidth / 8,
//                               height: 60,
//                               fit: BoxFit.scaleDown,
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(7, 0, 5, 0),
//                             child: Text(
//                               game.team1!.name,
//                               style: TextStyle(
//                                 fontFamily: 'Lato',
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             'VS',
//                             style: TextStyle(
//                               fontFamily: 'Lato',
//                               fontSize: 32,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(7, 0, 5, 0),
//                             child: Text(
//                               game.team2!.name,
//                               style: TextStyle(
//                                 fontFamily: 'Lato',
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(50),
//                             child: Image.asset(
//                               game.team2!.image,
//                               width: sizeWidth / 8,
//                               height: 60,
//                               fit: BoxFit.scaleDown,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: sizeWidth,
//                       child: Divider(
//                         height: 5,
//                         thickness: 2,
//                         color: Theme.of(context).colorScheme.onPrimaryContainer,
//                       ),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         Text(
//                           'VER DETALHES',
//                           style: TextStyle(
//                             fontFamily: 'Lato',
//                             fontSize: 20,
                            
//                           ),
//                         ),
//                         SizedBox(
//                           height: 25,
//                           child: VerticalDivider(
//                             width: 5,
//                             thickness: 2,
//                             color: Theme.of(context)
//                                 .colorScheme
//                                 .onPrimaryContainer,
//                           ),
//                         ),
//                         Text(
//                           'COMEÇAR JOGO',
//                           style: TextStyle(
//                             fontFamily: 'Lato',
//                             fontSize: 20,
//                             fontWeight: FontWeight.w800,
//                             color: Theme.of(context).colorScheme.primary,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
=======
class StartGame extends StatelessWidget {
  StartGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

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
                          "09:00",
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
                          child: Image.asset(
                            "assets/images/LOGO_1EAA_EXAMPLE.png",
                            width: sizeWidth / 8,
                            height: 60,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(7, 0, 5, 0),
                          child: Text(
                            "1EAA",
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
                            "3EAA",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/images/LOGO_3EAA_EXAMPLE.png",
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
                      Text(
                        'COMEÇAR JOGO',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
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
>>>>>>> 65aeb76d8b512d085d5d5bd6128e00fed88dd316
