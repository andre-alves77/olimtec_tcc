import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/features/championship/models/modality.dart';
import 'package:olimtec_tcc/app/features/championship/models/team.dart';

final initialConfigProvider = ChangeNotifierProvider<InitConfigStore>((ref) {
  return InitConfigStore();
});

class InitConfigStore extends ChangeNotifier {
  List<Team> teamList = [];
  List<Modality> modalitiesList = [
    Modality(
        category: "esporte de quadra", name: "basquete", scoreType: "1 a 100"),
    Modality(
        category: "esporte de quadra", name: "basquete", scoreType: "1 a 100"),
  ];
  List<Game> gameList = [];

  void addTeam(String teamName) {
    String teamImage = "";
    teamList.add(Team(
        name: teamName,
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'));

    notifyListeners();
  }

  void removeTeam(String teamName) {
    teamList.removeWhere(
      (element) => element.name == teamName,
    );
    notifyListeners();
  }

  void addModality(
      String modalityName, String modalityCategory, String modalityScore) {
    modalitiesList.add(Modality(
        category: modalityCategory,
        name: modalityName,
        scoreType: modalityScore));
    notifyListeners();
  }

  void removeModality(String modalityName) {
    modalitiesList.removeWhere(
      (element) => element.name == modalityName,
    );
    notifyListeners();
  }
}
