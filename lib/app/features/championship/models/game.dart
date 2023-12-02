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
  Team? winner;
  Team? looser;
  int round;
  String? local;
  String? time;
  final String modalidade;
  GameState gameState;

  Game({
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
