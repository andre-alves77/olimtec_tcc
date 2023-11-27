


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


}

logic() {
  List<Team> teams = [
    Team(name: "OPA1", image: "1"),
    Team(name: "OPA2", image: "2"),
    Team(name: "OPA3", image: "3"),
    Team(name: "OPA4", image: "4"),
    Team(name: "OPA5", image: "5"),
  ];

  var modality = Modality(teams,
      category: "QUADRA", name: "BASQUETE", icon: Icons.sports_basketball,);

  modality.generateBracket();
}
