import 'package:olimtec_tcc/app/models/game.dart';
import 'package:olimtec_tcc/app/models/team.dart';
import 'package:olimtec_tcc/app/models/teamList.dart';

List<Team> teamList_dummy = [
  Team(name: '3ºEAA', image: 'assets/images/LOGO_3EAA_EXAMPLE.png'),
  Team(name: "1ºEAB", image: 'assets/images/LOGO_1EAA_EXAMPLE.png'),
];

Game gametest = Game(
  team1: teamList_dummy.first,
  team2: teamList_dummy.last,
  local: 'Quadra 01',
  time: '09:15',
  modalidade: 'BASQUETE MASCULINO',
  gameState: GameState.inProgress,
);

List<Game> games = [
  gametest,
  gametest,
  gametest,
  gametest,
  gametest,
  gametest,
  gametest,
];
