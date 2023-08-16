// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:olimtec_tcc/app/models/team.dart';

enum GameState {
  inProgress,
  finished,
  predicted,
}

class Game {
  Team team1;
  Team team2;
  String local;
  String time;
  String modalidade;
  GameState gameState;

  Game({
    required this.team1,
    required this.team2,
    required this.local,
    required this.time,
    required this.modalidade,
    this.gameState = GameState.predicted,
  });
}
