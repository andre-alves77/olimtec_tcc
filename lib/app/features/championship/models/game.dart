// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:olimtec_tcc/app/features/championship/models/team.dart';

enum GameState {
  notConfigured,
  inProgress,
  finished,
  predicted,
}

class Game {
  int id;
  int? nextGame;
  String? team1;
  String? team2;
  int teamPts1 = 0;
  int teamSet1 = 0;
  int teamPts2 = 0;
  int teamSet2 = 0;
  bool isfinal;
  String? winner;
  String? looser;
  int round;
  String? local;
  String? time;
  final String modalidade;
  String gameState;
  String date;

  Game({
    this.winner,
    this.looser,
    this.local,
    this.time,
    this.teamPts1 = 0,
this.teamSet1 = 0,
this.teamPts2 = 0,
this.teamSet2 = 0,
    required this.date,
    required this.id,
    this.nextGame,
    this.team1,
    this.team2,
    required this.round,
    required this.modalidade,
    this.isfinal = false,
    this.gameState = "pendent",
  });




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nextGame': nextGame,
      'team1': team1,
      'team2': team2,
      'teamPts1': teamPts1,
      'teamSet1': teamSet1,
      'teamPts2': teamPts2,
      'teamSet2': teamSet2,
      'isfinal': isfinal,
      'winner': winner,
      'looser': looser,
      'round': round,
      'local': local,
      'time': time,
      'modalidade': modalidade,
      'gameState': gameState,
      'date': date,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'] as int,
      nextGame: map['nextGame'] != null ? map['nextGame'] as int : null,
      team1: map['team1'] != null ? map['team1'] as String : null,
      team2: map['team2'] != null ? map['team2'] as String : null,
      teamPts1: map['teamPts1'] as int,
      teamSet1: map['teamSet1'] as int,
      teamPts2: map['teamPts2'] as int,
      teamSet2: map['teamSet2'] as int,
      isfinal: map['isfinal'] as bool,
      winner: map['winner'] != null ? map['winner'] as String : null,
      looser: map['looser'] != null ? map['looser'] as String : null,
      round: map['round'] as int,
      local: map['local'] != null ? map['local'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      modalidade: map['modalidade'] as String,
      gameState: map['gameState'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Game.fromJson(String source) => Game.fromMap(json.decode(source) as Map<String, dynamic>);
}
