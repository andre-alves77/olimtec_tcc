// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/features/championship/models/modality.dart';
import 'package:olimtec_tcc/app/features/championship/models/team.dart';

class Championship {


  final List<Team> teams = [];
  final List<Game> games = [];
  final List<Modality> modalities = [];
  final bool isCreated;

  Championship({required this.isCreated});



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isCreated': isCreated,
    };
  }

  factory Championship.fromMap(Map<String, dynamic> map) {
    return Championship(
      isCreated: map['isCreated'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Championship.fromJson(String source) => Championship.fromMap(json.decode(source) as Map<String, dynamic>);
}
