import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/championship/models/championship.dart';
import 'package:olimtec_tcc/app/features/championship/models/game.dart';
import 'package:olimtec_tcc/app/features/championship/models/modality.dart';
import 'package:olimtec_tcc/app/features/championship/models/team.dart';

class ChampionshipRepository{
  List<Team>? teams;
  List<Game>? games;
  List<Modality>? modalities;
  bool? isCreated;

  Ref ref;
  Championship? championship;

  ChampionshipRepository({required this.ref}):super() {

  }


Future<Championship> getChampionship()async {

try{
   var query = FirebaseFirestore.instance.collection("championship");
   var data =await query.get();
   var map;
  for(var x in data.docs){
map = x.data();
  }



  //var champ = Championship.fromMap(map);
  

CustomSnackBar(ref: ref, message: "OPA");
return Championship(isCreated: false);


}catch (e){
throw CustomSnackBar(
              ref: ref, message: 'Um erro aconteceu. Tente novamente.',type: ScaffoldAlert.error);
}
}

  Stream<Championship?> getChampionshipStream() async*{
    var query = FirebaseFirestore.instance.collection("championship");

yield* query.snapshots().map((snap) {
  if(snap.docChanges.isNotEmpty){
var y = snap.docs.first.data();
return Championship.fromMap(y);
  }else{
    throw CustomSnackBar(
              ref: ref, message: 'Um erro aconteceu. Tente novamente.',type: ScaffoldAlert.error);
  }

});
  }
}