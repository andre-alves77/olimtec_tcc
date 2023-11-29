import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/championship/models/championship.dart';
import 'package:olimtec_tcc/app/features/championship/models/modality.dart';
import 'package:olimtec_tcc/app/features/championship/repository/championship.repository.dart';

final championshipRepositoryProvider =
    Provider((ref) => ChampionshipRepository(ref: ref));
final championshipStreamProvider = StreamProvider((ref) {
  var repo = ref.watch(championshipRepositoryProvider);

  return repo.getChampionshipStream();
});

Stream<Championship?> getChampionshipStream() async* {
  Future<List<dynamic>> _getModalities() async {
    List<dynamic> fieldValues = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("modality").get();
    for (var doc in querySnapshot.docs) {
      fieldValues.add(Modality(category: doc['category'], name: doc['name']));
    }
 

   return fieldValues;
  }
}

// final championshipProvider = StateProvider<Championship?>((ref) {
//   ref.watch(championshipStreamProvider).when(
//     data: (data){
// return data;
//   },
//    error: (e, s){
// return null;
//   }, 
//   loading: (){
//     return null;
//   });
// });}

