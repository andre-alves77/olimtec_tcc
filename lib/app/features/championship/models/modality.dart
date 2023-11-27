// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/features/championship/models/team.dart';

class Modality {
  final String name;
  IconData icon;
  final String category;
  final List<Team> teams;
  Map<int, List<Game>> bracket = {};
  String? scoreType;
  Modality(
    this.teams, {
    required this.category,
    required this.name,
    this.scoreType,
    this.icon = Icons.sports,
  });

  generateBracket() {
    Team? team2;
    Team? team1;
    int i = 0;
    Map<int, List<Game>> _bracket = {};
    List<Game> gameList = [];
    List<Team> _teams = teams;
    
    int gamesId = 1;
    int qtdround = 1;

    _teams.shuffle();
//ADICIONA UM TIME FALSO PARA FICAR PAR
    if (_teams.length % 2 == 0) {
      _teams.add(
        Team(name: 'PASSOU', image: "assets/images/PG13.png", players: null),
      );
      teams.add(
        Team(name: 'PASSOU', image: "assets/images/PG13.png", players: null),
      );
    }
//

int teamCounter = _teams.length - 1;
    int teamCounter2 = _teams.length;
if (teamCounter != 4 ||
          teamCounter != 8 ||
          teamCounter != 16 ||
          teamCounter != 32 ||
          teamCounter != 64) {

    while (i == 0) {
      if (teamCounter2 != 4 ||
          teamCounter2 != 8 ||
          teamCounter2 != 16 ||
          teamCounter2 != 32 ||
          teamCounter2 != 64) {
print(teamCounter);
        team1 = _teams[teamCounter];
        team2 = _teams[teamCounter-1];

        // Game(
        //   id: gamesId,
        //   nextGame: gamesId,
        //   round: qtdround,
        //   modalidade: name,
        //   team1: team1,
        //   team2: team2,
        // );

        gamesId++;
        teamCounter -= 2;
        teamCounter2 -= 2;
      } else {
        i = 1;
        qtdround++;
      }
    }
          }

    // if (_teams.length != 4 ||
    //     _teams.length != 8 ||
    //     _teams.length != 16 ||
    //     _teams.length != 32 ||
    //     _teams.length != 64) {
    //   int i = 1;
    //   teamCounter = _teams.length;
    //   qtdround = 1;
    //   while (i == 1) {
    //     int nextGame = 10;
    //     if (_teams.length != 4 ||
    //         _teams.length != 8 ||
    //         _teams.length != 16 ||
    //         _teams.length != 32 ||
    //         _teams.length != 64) {
    //       gameList.add(Game(
    //           id: gamesId,
    //           nextGame: nextGame,
    //           round: qtdround,
    //           modalidade: name,
    //           team1: _teams[teamCounter],
    //           team2: _teams[teamCounter - 1]));

    //       gamesId++;
    //       teamCounter -= 2;
    //     } else {
    //       _bracket.addAll({qtdround: gameList});
    //       i = 0;
    //       qtdround++;
    //     }
    //   }
    // }

    // _bracket.forEach((key, value) {
    //   print('\\\\\\\\');
    //   print("ROUND $key");
    //   value.forEach((element) {
    //     print("GAME ${element.id}");
    //     print(element.team1);
    //     print(element.team2);
    //   });
    // });

    // if (_teams.length % 2 == 0) if (
    //     teams.length != 4 ||
    //     teams.length != 8 ||
    //     teams.length != 16 ||
    //     teams.length != 32 ||
    //     teams.length != 64) {
    //   int i = 1;
    //   teamCounter = _teams.length;
    //   qtdround = 1;
    //   while (i == 1) {
    //     if (_teams.length != 4 ||
    //         _teams.length != 8 ||
    //         _teams.length != 16 ||
    //         _teams.length != 32 ||
    //         _teams.length != 64) {
    //       gameList.add(Game(
    //           id: gamesId,
    //           round: qtdround,
    //           modalidade: name,
    //           team1: _teams[teamCounter],
    //           team2: _teams[teamCounter - 1]));
    //       gamesId++;
    //       teamCounter -= 2;
    //     } else {
    //       _bracket.addAll({qtdround: gameList});
    //       i = 0;
    //       qtdround++;
    //     }
    //   }
    // }
  }
}
