import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/app.dart';
import 'package:olimtec_tcc/app/features/championship/models/modality.dart';
import 'package:olimtec_tcc/app/features/championship/models/team.dart';
import 'package:olimtec_tcc/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
  logic();
 
}

logic() {
  List<Team> teams = [
    Team(name: "OPA1", image: "1"),
    Team(name: "OPA2", image: "2"),
    Team(name: "OPA3", image: "3"),
    Team(name: "OPA4", image: "4"),
    Team(name: "OPA5", image: "5"),
    Team(name: "OPA6", image: "6"),
    Team(name: "OPA7", image: "7"),
    Team(name: "OPA8", image: "8"),
    Team(name: "OPA9", image: "9"),
    Team(name: "OPA10", image: "10"),
    Team(name: "OPA11", image: "11"),
  ];

  var modality = Modality(
  
    category: "QUADRA",
    name: "BASQUETE",
    icon: Icons.sports_basketball,
  );
  modality.generateBracket(teams);
}


//gcloud init

//FILE NAME: cors.json
// [
//   {
//     "origin": ["*"],
//     "method": ["GET"],
//     "maxAgeSeconds": 3600
//   }
// ]

//gsutil cors set cors.json gs://olimtec-59335.appspot.com

//https://www.phind.com/agent?cache=clphm5ynx000xl6083eetyndb