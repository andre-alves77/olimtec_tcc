import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/models/game.dart';
import 'package:olimtec_tcc/app/models/modality/modality.dart';
import 'package:olimtec_tcc/app/models/modality/modality_category.dart';
import 'package:olimtec_tcc/app/models/modality/modality_team.model.dart';
import 'package:olimtec_tcc/app/models/team.dart';

List<Team> teamList_dummy = [
  Team(name: '3ºEAA', image: 'assets/images/LOGO_3EAA_EXAMPLE.png'),
  Team(name: '3ºEAA', image: 'assets/images/LOGO_3EAA_EXAMPLE.png'),
  Team(name: '2ºEAA', image: 'assets/images/LOGO_3EAA_EXAMPLE.png'),
  Team(name: '1ºEAA', image: 'assets/images/LOGO_3EAA_EXAMPLE.png'),
  Team(name: "2ºEAB", image: 'assets/images/LOGO_1EAA_EXAMPLE.png'),
  Team(name: "1ºEAB", image: 'assets/images/LOGO_1EAA_EXAMPLE.png'),
];

List<ModalityCategory> modalityCategoryList_dummy = [
  ModalityCategory(name: 'Esportes de Quadra'),
  ModalityCategory(name: 'Jogos de Mesa'),
];

List<Modality> modalitiesList_dummy = [
  Modality(
      name: 'BASQUETE',
      icon: Icons.sports_basketball,
      category: modalityCategoryList_dummy[0]),
  Modality(
      name: 'FUTSAL',
      icon: Icons.sports_soccer_rounded,
      category: modalityCategoryList_dummy[0]),
  Modality(
      name: 'TÊNIS DE MESA',
      icon: Icons.panorama_fisheye_outlined,
      category: modalityCategoryList_dummy[1]),
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
