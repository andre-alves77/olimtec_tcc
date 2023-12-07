import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localsProvider = FutureProvider<Map<String, String>>((ref) async {
 final querySnapshot = await FirebaseFirestore.instance.collection('local').get();

 return {for (var doc in querySnapshot.docs) doc.id: doc['name']};
});