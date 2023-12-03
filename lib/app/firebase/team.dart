import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';

final teamRepositoryProvider = StateProvider((ref) {
  return TeamRepository(ref);
});


final teamNameStream = StreamProvider.family<String?,  String>((ref, teamName){
return ref.watch(teamRepositoryProvider).getStreamTeamImage(teamName);
});
class TeamRepository {
  TeamRepository(this.ref);
  final Ref ref;
  Stream<String?> getStreamTeamImage(String teamName) async* {
    String docId = "";
    dynamic documentId;
      var value = await FirebaseFirestore.instance
          .collection('team')
          .where("name", isEqualTo: teamName);


    yield* value.snapshots().map((snap) {
        if (snap.docChanges.isNotEmpty) {
          var y = snap.docs.first.data();
          return y['image'];
        } else {
          throw CustomSnackBar(
              ref: ref,
              message: 'Um erro aconteceu. Tente novamente.',
              type: ScaffoldAlert.error);
        }
      });
    //return "https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/teamName%2F724050---suplemento-alimentar-liquido-reign-melon-mania-473ml.webp?alt=media&token=84f30d0e-9d53-4218-9278-d4e041e34dda";
  }
}
