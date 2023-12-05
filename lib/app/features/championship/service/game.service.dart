import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/features/championship/repository/game.repository.dart';

final gamesRepositoryProvider = Provider((ref){
return GamesRepository(ref);
});

final gamesIDProvider = FutureProvider<List<String>?>((ref){
  return ref.read(gamesRepositoryProvider).getGamesID();
});



