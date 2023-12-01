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
  List<Modality> modalitiesList = [];
  List<Game> gameList = [];
  List<String> localList = [];

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

  void addLocal(String localName) {
    localList.add(localName);
    notifyListeners();
  }

  void removeLocal(String localName) {
    localList.removeWhere((element) => element == localName);
    notifyListeners();
  }
}
