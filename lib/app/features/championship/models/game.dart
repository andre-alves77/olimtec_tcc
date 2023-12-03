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
  Team? team1;
  Team? team2;
  bool isfinal;
  String? winner;
  String? looser;
  int round;
  String? local;
  String? time;
  final String modalidade;
  GameState gameState;
  String date;

  Game({
    this.winner,
    this.looser,
    this.local,
    this.time,
    required this.date,
    required this.id,
    this.nextGame,
    this.team1,
    this.team2,
    required this.round,
    required this.modalidade,
    this.isfinal = false,
    this.gameState = GameState.notConfigured,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nextGame': nextGame,
      'team1': team1?.toMap(),
      'team2': team2?.toMap(),
      'isfinal': isfinal,
      'winner': winner,
      'looser': looser,
      'round': round,
      'local': local,
      'time': time,
      'modalidade': modalidade,
      'date': date,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'] as int,
      nextGame: map['nextGame'] as int,
      team1: map['team1'] != null ? Team.fromMap(map['team1'] as Map<String,dynamic>) : null,
      team2: map['team2'] != null ? Team.fromMap(map['team2'] as Map<String,dynamic>) : null,
      isfinal: map['isfinal'] as bool,
      winner: map['winner'] != null ? map['winner'] as String : null,
      looser: map['looser'] != null ? map['looser'] as String : null,
      round: map['round'] as int,
      local: map['local'] != null ? map['local'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      modalidade: map['modalidade'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Game.fromJson(String source) => Game.fromMap(json.decode(source) as Map<String, dynamic>);
}
