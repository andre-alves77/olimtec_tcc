// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';

import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/features/championship/models/team.dart';

class Modality {
  final String name;
  Map<String, dynamic> icon;
  String category;
  Map<int, List<Game>> bracket = {};
  String? scoreType;
  Modality({
    required this.category,
    required this.name,
    this.scoreType,
    required this.icon,
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
        Team(name: 'Passou', image: "assets/images/PG13.png", playersList: null),
      );
    }
    teams.shuffle();
    int teamCounter = teams.length;

//FALTOU DEFINIR OS NEXT GAMES DE FORMA CORRETA 
      int qtdFirstRoundTeams = 0;
      if (teamCounter < 8) {
        qtdFirstRoundTeams = teamCounter - 4;
        brackertype = 4;
nextGame = brackertype;
      } else if (teamCounter >= 8 && teamCounter < 16) {
        qtdFirstRoundTeams = teamCounter - 8;
        brackertype = 8;
        nextGame = brackertype-1;
      } else if (teamCounter >= 16 && teamCounter < 32) {
        qtdFirstRoundTeams = teamCounter - 16;
        brackertype = 16;
        nextGame = brackertype;
      } else if (teamCounter >= 32 && teamCounter < 64) {
        qtdFirstRoundTeams = teamCounter - 32;
        brackertype = 32;
        nextGame = brackertype;
      } else if (teamCounter >= 64 && teamCounter < 128) {
        qtdFirstRoundTeams = teamCounter - 64;
        brackertype = 64;
        nextGame = brackertype;
      }


int _generate_nextGame(){
int myint = nextGame;
if(nextGameCounter){
nextGame++;
}
nextGameCounter = !nextGameCounter;
  return myint;
}

    if (teamCounter != 4 &&
        teamCounter != 8 &&
        teamCounter != 16 &&
        teamCounter != 32 &&
        teamCounter != 64) {


//ROUND 1
      //nextGame = qtdFirstRoundTeams + 1;
      teamCounter -= 1;
      while (qtdFirstRoundTeams > i) {
        // print("ROUND $qtdround >>> JOGO $gamesId >>> $nextGame");
        team1 = teams[teamCounter];
        team2 = teams[teamCounter - 1];
       // print("${teams[teamCounter].name} X ${teams[teamCounter - 1].name}");
        gameList.add(Game(
          date: "indefinida", // tirar date: name
          id: gamesId,
          nextGame: _generate_nextGame(),
          round: qtdround,
          modalidade: name,
          team1: team1.name,
          team2: team2.name,
        ));
        gamesId++;
        i++;
        teamCounter -= 2;
      }
      bracket.addAll({qtdround: gameList});
      qtdround++;
//ROUND 2
      gameList = [];
      i = 0;
     //nextGame = qtdFirstRoundTeams + brackertype * (qtdround - 1) + 1;
     nextGame = 9;
      while (i < brackertype) {
        if (teamCounter > 0) {
        //  print("ROUND $qtdround >>> JOGO $gamesId >>> $nextGame");
        //  print("${teams[teamCounter].name} X ${teams[teamCounter - 1].name}");
        // print("opa2");
          gameList.add(Game(
            date: "indefinida", // tirar date: name
              id: gamesId,
              nextGame: _generate_nextGame(),
              round: qtdround,
              modalidade: name,
              team1: teams[teamCounter].name,
              team2: teams[teamCounter - 1].name));
          teamCounter -= 2;
        } else {
         // print("opa1");
         // print("ROUND $qtdround >>> JOGO $gamesId >>> $nextGame");
          gameList.add(Game(
            date: "indefinida", // tirar date: name
              id: gamesId,
              nextGame:  _generate_nextGame(),
              round: qtdround,
              modalidade: name,));
        }
      
        i+=2;
        gamesId++;
      
      bracket.addAll({qtdround: gameList});
    }
}else{
      nextGame = qtdFirstRoundTeams + 1;
    }


int brackerCounter = brackertype/qtdround as int;

if(brackertype == 4){
i = 1;
}else if(brackertype == 8){
i = 2;
}else if(brackertype == 16){
i=3;
}else if(brackertype == 64){
i=4;
}

int x = 0;


// int qtdteamsperround = brackerCounter/(2*i)as int;

int teamsPerRound =i*2;
while(x < i){
teamCounter = 0;
  gameList= [];
// print(qtdround);
// print(qtdteamsperround);

while(teamsPerRound > teamCounter){

  if(teamsPerRound>2){


gameList.add(Game(id: gamesId, nextGame: _generate_nextGame(), round: qtdround, modalidade: name, date: name));// tirar date:name
  }else{
gameList.add(Game(id: gamesId, isfinal: true, round: qtdround, modalidade: name, date: name)); // tirar date:name
  }

gamesId++;
teamCounter+=2;
}

qtdround++;
x++;
teamsPerRound =(i-x)*2;

  bracket.addAll({qtdround: gameList});
}

  bracket.forEach((key, value) {
    print("ROUND $key");
    value.forEach((element) {
      print("GAME ${element.id} >>> NEXT GAME ${element.nextGame}");
      print(element.team1);
     print(element.team2);
     if(element.isfinal == true){
      print(element.isfinal);
     }
      
    });
     print('\\\\\\\\');
  });

  }




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon,
      'category': category,
      'scoreType': scoreType,
    };
  }

 

  factory Modality.fromMap(Map<String, dynamic> map) {

    return Modality(
      name: map['name'] as String,
      icon: Map<String, dynamic>.from((map['icon'] as Map<String, dynamic>)),
      category: map['category'] as String,
      scoreType: map['scoreType'] != null ? map['scoreType'] as String : null,
      );
  }

  String toJson() => json.encode(toMap());

  factory Modality.fromJson(String source) => Modality.fromMap(json.decode(source) as Map<String, dynamic>);
}
