import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';

class GamesRepository {

  Ref ref;

  GamesRepository(this.ref);

  Future<List<String>> getGamesID()async {
    List<String> _gamesIdList = [];
    try{
var query = await FirebaseFirestore.instance.collection('game').get();

  
  query.docs.forEach((element) {
     _gamesIdList.add(element.id);
  });

    }catch (e){
      throw CustomSnackBar(message: "error", ref: ref);
    }
 print(_gamesIdList);
  return _gamesIdList;
  }



}