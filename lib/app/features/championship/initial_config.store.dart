import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/features/championship/models/modality.dart';
import 'package:olimtec_tcc/app/features/championship/models/team.dart';

final initialConfigProvider = ChangeNotifierProvider<InitConfigStore>((ref) {
  return InitConfigStore(ref);
});

class InitConfigStore extends ChangeNotifier {
  final Ref ref;
  IconData? icon = Icons.sports_gymnastics_outlined;
  Map<String, dynamic> serializedIcon = {};
  List<Team> teamList = [
    Team(
        name: "1DSB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "2DSB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "3DSB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "1DSA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "2DSA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "3DSA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "1EAA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "2EAA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "3EAA",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "1EAB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "2EAB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
    Team(
        name: "3EAB",
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'),
  ];
  List<Modality> modalitiesList = [];
  List<Game> gameList = [];
  List<String> localList = [];

  InitConfigStore(this.ref);

  Map<String, dynamic> serializeIcon(IconData icon) {
    return {
      'codePoint': icon.codePoint,
      'fontFamily': icon.fontFamily,
    };
  }

  IconData deserializeIcon(Map<String, dynamic> iconData) {
    return IconData(iconData['codePoint'], fontFamily: iconData['fontFamily']);
  }

  setIcon(IconData iconData) {
    serializedIcon = serializeIcon(iconData);
    icon = iconData;
    notifyListeners();
  }

  void addTeam(String teamName) {
    String teamImage = "";
    teamList.add(Team(
        name: teamName,
        image:
            'https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/images%2FTEMPLATELOGO-removebg-preview.png?alt=media&token=b699f564-8f5f-413a-9a0b-29d7c5f6bb36'));

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
    print(modalityName);
    if (modalityName.length > 2 &&
        modalityCategory != "Selecione a categoria" &&
        modalityScore != "Selecione o tipo de placar") {
      setIcon(icon!);
      modalitiesList.add(Modality(
          category: modalityCategory,
          name: modalityName,
          scoreType: modalityScore,
          icon: serializedIcon));
    } else {
      CustomSnackBar(
          message: "PREENCHA TODOS OS CAMPOS",
          type: ScaffoldAlert.error,
          ref: ref);
    }
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


void restart_championship(){
  

  
}

  void create_championship() async {
    try {
      modalitiesList.forEach((element) async {
        element.generateBracket(teamList);
        await FirebaseFirestore.instance
            .collection('modality')
            .doc()
            .set(element.toMap());
        element.bracket.forEach((key, value) {
          value.forEach((element) async {
            await FirebaseFirestore.instance
                .collection("game")
                .doc()
                .set(element.toMap());
          });
        });
      });

      teamList.forEach(
        (element) async {
          await FirebaseFirestore.instance
              .collection('team')
              .doc()
              .set(element.toMap());
        },
      );

      localList.forEach((element) async {
        Map<String, String> _mymap = {"name": element};
        await FirebaseFirestore.instance.collection('local').doc().set(_mymap);
          await FirebaseFirestore.instance.collection('championship').doc("MTayq9MuIFOUqqBsgWTQ").update({'isCreated':true});
  ref.read(authRepositoryProvider).signOut();


      });
    } catch (e) {
      CustomSnackBar(message: "Ocorreu um erro", ref: ref);
    }
    notifyListeners();
  }
}
