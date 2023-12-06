import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/features/championship/models/modality.dart';
import 'package:olimtec_tcc/app/features/championship/models/team.dart';

final initialConfigProvider = ChangeNotifierProvider<InitConfigStore>((ref) {
  return InitConfigStore(ref);
});

class InitConfigStore extends ChangeNotifier {
  final Ref ref;
  List<Team> teamList = [
    Team(
        name: "1DSB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "2DSB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "3DSB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "1DSA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "2DSA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "3DSA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "1EAA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "2EAA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "3EAA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "1EAB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "2EAB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
    Team(
        name: "3EAB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/avatar%2F1701317816608?alt=media&token=97606ab7-ecb0-47f1-b86c-f4cb6fc0c1f2'),
  ];
  List<Modality> modalitiesList = [];
  List<Game> gameList = [];
  List<String> localList = [];

  InitConfigStore(this.ref);

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

  void create_championship() async {


try {
final instance = FirebaseFirestore.instance;
final batch = instance.batch();

var collection = instance.collection('team');
var snapshots = await collection.get();

for (var doc in snapshots.docs) {
 batch.delete(doc.reference);
}

var collection2 = instance.collection('game');
var snapshots2 = await collection2.get();

for (var doc in snapshots2.docs) {
 batch.delete(doc.reference);
}

var collection3 = instance.collection('modality');
var snapshots3 = await collection3.get();

for (var doc in snapshots3.docs) {
 batch.delete(doc.reference);
}


await batch.commit();

 

    modalitiesList.forEach(
      (element) async {
        element.generateBracket(teamList);
        await FirebaseFirestore.instance
            .collection('modality')
            .doc()
            .set(element.toMap());
      },
    );
teamList.forEach((element) async{
  await FirebaseFirestore.instance.collection('team').doc().set(element.toMap());
},);

localList.forEach((element)async {
  await FirebaseFirestore.instance.collection('local').doc().set({"name":element});
  
},);
}catch (e){
CustomSnackBar(message: "Ocorreu um erro", ref: ref);
}
    notifyListeners();
  }
}
