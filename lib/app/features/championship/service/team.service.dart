import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTeamImage = FutureProvider.family<String, String>((ref, team) async{


var query =await FirebaseFirestore.instance.collection('team').where("name", isEqualTo: team).get();
return query.docs.first.data().entries.first.value;
} );