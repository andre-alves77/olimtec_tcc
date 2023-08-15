// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:olimtec_tcc/app/models/team.dart';

class Game {
  Team team1;
  Team team2;
  Team? winner;
  String local;
  String time;
  String modalidade;

  Game({
    required this.team1,
    required this.team2,
    required this.local,
    required this.time,
    required this.modalidade,
  });
}
