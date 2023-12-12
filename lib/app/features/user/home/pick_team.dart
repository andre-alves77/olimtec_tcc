import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/lading.store.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';

class PickScreen extends ConsumerWidget {
  const PickScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teams = ref.watch(getTeamStringProvider);


    String? team = '';

    return Scaffold(
      body: Center(child: teams.when(
                data: (data) {
                  if (data != null) {
                    var items =
                        data.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList();
                    return Column(
                      children: [
                        Text('Escolha sua sala'),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: DropdownMenu(
                              label: Text("SALA"),
                              requestFocusOnTap: false,
                              dropdownMenuEntries: items,
                              onSelected: (value) {
                                team = value;
                              }),
                        ),
                        ElevatedButton(onPressed: ()async{
                          final id = ref.watch(appUserStream).value!.id;
                          print(id);
                          print(team);
                          String docid = "";
                          await FirebaseFirestore.instance.collection('users').where('id', isEqualTo: id).get().then((value) {
                            docid = value.docs.first.id;});

                          await FirebaseFirestore.instance.collection('users').doc(docid).update({'teamName':team});
                        }, child: Text('CONFIRMAR')),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
                loading: () {
                  return CircularProgressIndicator();
                },
                skipError: true,
                error: (e, s) {
                  CustomSnackBar(
                      message: "Um erro aconteceu. Tente novamente.", ref: ref);
                  return Placeholder();
                },
              ),),
    );
  }
}