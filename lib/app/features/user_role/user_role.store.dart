import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/models/user.model.dart';
import 'package:olimtec_tcc/app/models/team.dart';

class UserRoleAdminStore extends ChangeNotifier{
  UserRoleAdminStore(this.ref);
  Ref ref;
  List<Team> teams = [];
  getTeams() async{
teams = [];
var query = await FirebaseFirestore.instance.collection('teams').get().catchError((e){CustomSnackBar(message: 'Um erro aconteceu. Tente novamente', ref: ref, type: ScaffoldAlert.error);});
var data = {};

for(var x in query.docs){
data[x.id] = x.data();
}
data.forEach((key, value) {
  var team = Team.fromMap(value);
  teams.add(team);
});
 
  }
  
//   Stream<List<AppUser>> getOrganization(Team team){

// return ;
//   }
}