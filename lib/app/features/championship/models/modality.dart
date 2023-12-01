// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/features/championship/models/team.dart';

class Modality {
  final String name;
  IconData icon;
  final String category;
  Map<int, List<Game>> bracket = {};
  String? scoreType;
  Modality({
    required this.category,
    required this.name,
    this.scoreType,
    this.icon = Icons.sports,
  });

  generateBracket(List<Team> teams) {
    Team? team2;
    Team? team1;
    int i = 0;
    Map<int, List<Game>> _bracket = {};
    List<Game> gameList = [];
    int nextGame = 1;
    int brackertype = 4;
    int gamesId = 1;
    int qtdround = 1;
    bool nextGameCounter = false;
    

  


//ADICIONA UM TIME FALSO PARA FICAR PAR

    if (teams.length % 2 != 0) {
      teams.add(
        Team(name: 'Passou', image: "assets/images/PG13.png", players: null),
      );
    }
    teams.shuffle();
    int teamCounter = teams.length;


      int qtdFirstRoundTeams = 0;
      if (teamCounter < 8) {
        qtdFirstRoundTeams = teamCounter - 4;
        brackertype = 4;
      } else if (teamCounter >= 8 && teamCounter < 16) {
        qtdFirstRoundTeams = teamCounter - 8;
        brackertype = 8;
      } else if (teamCounter >= 16 && teamCounter < 32) {
        qtdFirstRoundTeams = teamCounter - 16;
        brackertype = 16;
      } else if (teamCounter >= 32 && teamCounter < 64) {
        qtdFirstRoundTeams = teamCounter - 32;
        brackertype = 32;
      } else if (teamCounter >= 64 && teamCounter < 128) {
        qtdFirstRoundTeams = teamCounter - 64;
        brackertype = 64;
      }
nextGame = brackertype;

int _generate_nextGame(){
int myint = nextGame;
if(nextGameCounter){
nextGame++;
}
nextGameCounter = !nextGameCounter;
print(myint);
  return myint;
}
_generate_nextGame();
_generate_nextGame();
_generate_nextGame();
_generate_nextGame();
_generate_nextGame();
_generate_nextGame();


    if (teamCounter != 4 &&
        teamCounter != 8 &&
        teamCounter != 16 &&
        teamCounter != 32 &&
        teamCounter != 64) {


//ROUND 1
      nextGame = qtdFirstRoundTeams + 1;
      teamCounter -= 1;
      while (qtdFirstRoundTeams > i) {
        print("ROUND $qtdround >>> JOGO $gamesId >>> $nextGame");
        team1 = teams[teamCounter];
        team2 = teams[teamCounter - 1];
        print("${teams[teamCounter].name} X ${teams[teamCounter - 1].name}");
        gameList.add(Game(
          id: gamesId,
          nextGame: gamesId,
          round: qtdround,
          modalidade: name,
          team1: team1,
          team2: team2,
        ));
        gamesId++;
        i++;
        teamCounter -= 2;
        nextGame++;
      }
      bracket.addAll({qtdround: gameList});
      qtdround++;
//ROUND 2
      gameList = [];
      i = 0;
      nextGame = qtdFirstRoundTeams + brackertype * (qtdround - 1) + 1;
      print(brackertype);
      while (i < brackertype) {
        if (teamCounter > 0) {
          print("ROUND $qtdround >>> JOGO $gamesId >>> $nextGame");
          print("${teams[teamCounter].name} X ${teams[teamCounter - 1].name}");
          print("opa2");
          gameList.add(Game(
              id: gamesId,
              nextGame: _generate_nextGame(),
              round: qtdround,
              modalidade: name,
              team1: teams[teamCounter],
              team2: teams[teamCounter - 1]));
          teamCounter -= 2;
        } else {
          print("opa1");
          print("ROUND $qtdround >>> JOGO $gamesId >>> $nextGame");
          gameList.add(Game(
              id: gamesId,
              nextGame:  _generate_nextGame(),
              round: qtdround,
              modalidade: name,));
        }
        nextGame++;
        i++;
        gamesId++;
      
      bracket.addAll({qtdround: gameList});
    }

}

int brackerCounter = brackertype/qtdround as int;

if(brackertype == 4){
i = 2;
}else if(brackertype == 8){
i = 4;
}else if(brackertype == 16){
i=8;
}else if(brackertype == 64){
i=16;
}

int x = 0;


teamCounter = 0;
while(x < i){
int qtdteamsperround = brackerCounter/(2*i)as int;
print(qtdround);
print(qtdteamsperround);

qtdround++;
x++;
}

  bracket.forEach((key, value) {
    print('\\\\\\\\');
    print("ROUND $key");
    value.forEach((element) {
      print("GAME ${element.id}");
      print(element.team1);
      print(element.team2);
    });
  });

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