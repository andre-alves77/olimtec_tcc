import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDocIdTeamProvider =
    FutureProvider.autoDispose.family<String, String>((ref, fieldValue) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('team')
      .where('name', isEqualTo: fieldValue)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return querySnapshot.docs.first.id;
  } else {
    throw Exception('No document found');
  }
});

final getModalityTeamIdProvider =
    FutureProvider.family<String, List<String>>((ref, list) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('team')
      .doc(list[0])
      .collection('modalityTeam')
      .where("modality", isEqualTo: list[1])
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return querySnapshot.docs.first.id;
  } else {
    throw Exception('No document found');
  }
});

final modalitiesTeamProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, String>((ref, teamId) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('team')
      .doc(teamId)
      .collection('modalityTeam')
      .get();
  return Map.fromIterable(
    snapshot.docs,
    key: (doc) => doc.id,
    value: (doc) => doc.data(),
  );
});
