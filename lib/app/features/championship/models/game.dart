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
  GameState gameState;
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
    this.gameState = GameState.notConfigured,
  });

}
