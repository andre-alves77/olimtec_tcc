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

//ADICIONA UM TIME FALSO PARA FICAR PAR

    if (teams.length % 2 != 0) {
      teams.add(
        Team(name: 'Passou', image: "assets/images/PG13.png", players: null),
      );
    }
    teams.shuffle();
    int teamCounter = teams.length;

    if (teamCounter != 4 ||
        teamCounter != 8 ||
        teamCounter != 16 ||
        teamCounter != 32 ||
        teamCounter != 64) {
      int qtdFirstRoundTeams = 0;
      if (teamCounter < 4) {
        qtdFirstRoundTeams = 4 - teamCounter;
      } else if (teamCounter < 8) {
        qtdFirstRoundTeams = 8 - teamCounter;
      } else if (teamCounter < 16) {
        qtdFirstRoundTeams = 16 - teamCounter;
      } else if (teamCounter < 32) {
        qtdFirstRoundTeams = 32 - teamCounter;
      } else if (teamCounter < 64) {
        qtdFirstRoundTeams = 64 - teamCounter;
      }

      teamCounter -= 1;
      while ((qtdFirstRoundTeams) > i) {
        print("JOGO $gamesId");
        team1 = teams[teamCounter];
        print(team1.name);
        team2 = teams[teamCounter - 1];
        print(team2.name);
        Game(
          id: gamesId,
          nextGame: gamesId,
          round: qtdround,
          modalidade: name,
          team1: team1,
          team2: team2,
        );
        gamesId++;
        i++;
        teamCounter -= 2;
      }
    }

    // if (teamCounter != 4 ||
    //     teamCounter != 8 ||
    //     teamCounter != 16 ||
    //     teamCounter != 32 ||
    //     teamCounter != 64) {
    //   while (i == 0) {
    //     if (teamCounter2 != 4 &&
    //         teamCounter2 != 8 &&
    //         teamCounter2 != 16 &&
    //         teamCounter2 != 32 &&
    //         teamCounter2 != 64 &&
    //         teamCounter != 0) {
    //       print(teamCounter);
    //       team1 = _teams[teamCounter];
    //       team2 = _teams[teamCounter - 1];

    //       // Game(
    //       //   id: gamesId,
    //       //   nextGame: gamesId,
    //       //   round: qtdround,
    //       //   modalidade: name,
    //       //   team1: team1,
    //       //   team2: team2,
    //       // );

    //       gamesId++;
    //       teamCounter -= 2;
    //       teamCounter2 -= 2;
    //     } else {
    //       i = 1;
    //       qtdround++;
    //     }
    //   }
    // }

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
