import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/models/championship.dart';
import 'package:olimtec_tcc/app/features/championship/repository/championship.repository.dart';

final championshipRepositoryProvider = Provider((ref) => ChampionshipRepository(ref: ref));


final championshipStreamProvider = StreamProvider((ref) {
  var repo = ref.watch(championshipRepositoryProvider);

return repo.getChampionshipStream();

}
);


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
// });