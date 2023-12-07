import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: ref.watch(pendentDocumentIdsProvider(argModality!)).when(
                data: (mapA) {


              return ListView.builder(
                  itemCount: mapA.length,
                  itemBuilder: ((_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AddGamecardStream(docId: mapA[index]),
                    );
                  }),
               
              );
            }, error: (e, s) {
              CustomSnackBar(message: "Ocorreu um erro", ref: ref);
              Navigator.pop(context);
              return SizedBox();
            }, loading: () {
              return LoadingPage();
            }),
          ),
        ));
  }
}

