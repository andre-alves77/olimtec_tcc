import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/repository/game.repository.dart';

final gamesRepositoryProvider = Provider((ref){
return GamesRepository(ref);
});

final gamesIDProvider = FutureProvider<List<String>?>((ref){
  return ref.read(gamesRepositoryProvider).getGamesID();
});