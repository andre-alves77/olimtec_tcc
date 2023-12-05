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

final getModalityTeam = FutureProvider.autoDispose
    .family<Map<String, dynamic>, String>((ref, list) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('team')
      .doc(list)
      .collection('modalityTeam')
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return querySnapshot.docs.first.data() as Map<String, dynamic>;
  } else {
    throw Exception('No document found');
  }
});
