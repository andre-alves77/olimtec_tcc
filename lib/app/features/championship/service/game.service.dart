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

final gamesIDProviderInFinished = FutureProvider<List<String>?>((ref){
  return ref.read(gamesRepositoryProvider).getGamesIDInFinished();
});

final inProgressGamesProvider = StreamProvider<List<String>>(
 (ref) {
   return FirebaseFirestore.instance
       .collection('game')
       .where('gameState', isEqualTo: 'inProgress')
       .snapshots()
       .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.id).toList());
 },
);

final finishedGamesProvider = StreamProvider<List<String>>(
 (ref) {
   return FirebaseFirestore.instance
       .collection('game')
       .where('gameState', isEqualTo: 'finished')
       .snapshots()
       .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.id).toList());
 },
);

final predictedGamesProvider = StreamProvider<List<String>>(
 (ref) {
   return FirebaseFirestore.instance
       .collection('game')
       .where('gameState', isEqualTo: 'predicted')
       .snapshots()
       .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.id).toList());
 },
);

final pendentGamesProvider = StreamProvider<List<String>>(
 (ref) {
   return FirebaseFirestore.instance
       .collection('game')
       .where('gameState', isEqualTo: 'pendent')
       .snapshots()
       .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.id).toList());
 },
);



