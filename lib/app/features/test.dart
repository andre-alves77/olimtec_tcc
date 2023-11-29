import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/championship/models/modality.dart';

final getModalitiesProvider = FutureProvider((ref) async {
  try {
    Future<List<String>> _getModalities() async {
      List<String> fieldValues = [];

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("modality").get();
      for (var doc in querySnapshot.docs) {
        fieldValues.add(doc["category"]);
      }
      return fieldValues;
    }

    return _getModalities();
  } catch (e) {
    CustomSnackBar(message: 'Error', ref: ref);
  }
});