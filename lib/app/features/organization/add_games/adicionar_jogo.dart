import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/features/championship/repository/team.service.dart';
import 'package:olimtec_tcc/app/features/championship/service/game.service.dart';
import 'package:olimtec_tcc/app/features/test.dart';
import 'package:olimtec_tcc/app/shared/views/loading_page.dart';
import 'package:olimtec_tcc/app/ui/shared/addgame_card.dart';
import 'package:provider/provider.dart';

class AddGameOrganization extends ConsumerWidget {
  const AddGameOrganization({super.key});

  static String route = "/addgame-organization";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final game = ref.watch(getGameMapProvider("5fst3OI7KUEHKNvyhaYs")).value;
    final String? argModality =
        ModalRoute.of(context)?.settings.arguments as String;
  
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ADICIONAR JOGO",
            style: TextStyle(
                fontFamily: 'Lato', fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ref.watch(pendentDocumentIdsProvider(argModality!)).when(
            data: (data) {
      final gamesId = ref.watch(pendentDocORDERIdsProvider(argModality!)).value;

          return ListView.builder(
              itemCount: gamesId!.length,
              itemBuilder: ((_, index) {
                return GameCardStream(docId: gamesId[index]);
              }),
           
          );
        }, error: (e, s) {
          CustomSnackBar(message: "Ocorreu um erro", ref: ref);
          Navigator.pop(context);
          return SizedBox();
        }, loading: () {
          return LoadingPage();
        }));
  }
}
