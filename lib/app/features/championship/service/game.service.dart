import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/features/championship/repository/game.repository.dart';

final gamesRepositoryProvider = Provider((ref) {
  return GamesRepository(ref);
});

final gamesIDProvider = FutureProvider<List<String>?>((ref) {
  return ref.read(gamesRepositoryProvider).getGamesID();
});

final gamesModalityIDProvider =
    FutureProvider.family<List<String>?, String>((ref, modality) {
  return ref.watch(gamesRepositoryProvider).getModalityGamesID(modality);
});

final gamesIDProviderInFinished = FutureProvider<List<String>?>((ref) {
  return ref.read(gamesRepositoryProvider).getGamesIDInFinished();
});

final inProgressGamesProvider = StreamProvider<List<String>>(
  (ref) {
    return FirebaseFirestore.instance
        .collection('game')
        .where('gameState', isEqualTo: 'inProgress')
        .snapshots()
        .map((querySnapshot) =>
            querySnapshot.docs.map((doc) => doc.id).toList());
  },
);

final finishedGamesProvider = StreamProvider.autoDispose<List<String>>(
  (ref) {
    return FirebaseFirestore.instance
        .collection('game')
        .where('gameState', isEqualTo: 'finished')
        .snapshots()
        .map((querySnapshot) =>
            querySnapshot.docs.map((doc) => doc.id).toList());
  },
);

final predictedGamesProvider = StreamProvider<List<String>>(
  (ref) {
    return FirebaseFirestore.instance
        .collection('game')
        .where('gameState', isEqualTo: 'predicted')
        .snapshots()
        .map((querySnapshot) =>
            querySnapshot.docs.map((doc) => doc.id).toList());
  },
);

final pendentGamesProvider = StreamProvider<List<String>>(
  (ref) {
    return FirebaseFirestore.instance
        .collection('game')
        .where('gameState', isEqualTo: 'pendent')
        .snapshots()
        .map((querySnapshot) =>
            querySnapshot.docs.map((doc) => doc.id).toList());
  },
);

final pendentDocORDERIdsProvider =
    StreamProvider.autoDispose.family<List<String>, String>((ref, modality) {
  final querySnapshot = FirebaseFirestore.instance
      .collection('game')
      .where('gameState', isEqualTo: 'pendent')
      .where('modalidade', isEqualTo: modality)
      .orderBy('id')
      .snapshots();

  return querySnapshot
      .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.id).toList());
});

final pendentDocumentIdsProvider =
    StreamProvider.autoDispose.family<List<String>, String>((ref, modality) {
  final querySnapshot = FirebaseFirestore.instance
      .collection('game')
      .where('gameState', isEqualTo: 'pendent')
      .where('modalidade', isEqualTo: modality)
      .snapshots();

  return querySnapshot
      .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.id).toList());
});

final getGameMapProvider =
    FutureProvider.family<Map<String, dynamic>, String>((ref, docid) {
  return FirebaseFirestore.instance
      .collection('game')
      .doc(docid)
      .get()
      .then((value) => value.data() as Map<String, dynamic>);
});

final gamesDocORDERIdsProvider =
    StreamProvider.autoDispose.family<List<String>, String>((ref, modality) {
  final querySnapshot = FirebaseFirestore.instance
      .collection('game')
      .where('modalidade', isEqualTo: modality)
      .orderBy('id')
      .snapshots();

  return querySnapshot
      .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.id).toList());
});

final gameStreamProvider = StreamProvider.autoDispose
    .family<Map<String, dynamic>, String>((ref, documentId) {
  return FirebaseFirestore.instance
      .collection('game')
      .doc(documentId)
      .snapshots()
      .map((snapshot) => snapshot.data() as Map<String, dynamic>);
});

final predictedgamesDocORDERIdsProvider =
    StreamProvider.autoDispose.family<List<String>, String>((ref, modality) {
  final querySnapshot = FirebaseFirestore.instance
      .collection('game')
      .where('modalidade', isEqualTo: modality)
      .where('gameState', isEqualTo: 'predicted')
      .orderBy('id')
      .snapshots();

  return querySnapshot
      .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.id).toList());
});

final inProgressgamesDocORDERIdsProvider =
    StreamProvider.autoDispose.family<List<String>, String>((ref, modality) {
  final querySnapshot = FirebaseFirestore.instance
      .collection('game')
      .where('modalidade', isEqualTo: modality)
      .where('gameState', isEqualTo: 'inProgress')
      .orderBy('id')
      .snapshots();

  return querySnapshot
      .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.id).toList());
});


final getTeam2 = FutureProvider.family<String, List<String>>((ref, team) async {
  var query = await FirebaseFirestore.instance
      .collection('game')
        .where("modalidade", isEqualTo: team[0]).where('id', isEqualTo: team[1])
      .get();
  return query.docs.first.id;
});
final carouselStreamProvider = StreamProvider.autoDispose<List<Game>>((ref) {
  final stream = FirebaseFirestore.instance
      .collection('game')
      .where('gameState', isEqualTo: 'predicted')
      .snapshots();
  return stream
      .map((snapshot) =>
          snapshot.docs.map((doc) => Game.fromMap(doc.data())).toList());
});
