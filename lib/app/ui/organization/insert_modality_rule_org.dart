import 'dart:io';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/championship/repository/team.service.dart';

class InsertRuleOrganization extends ConsumerWidget {
  const InsertRuleOrganization({super.key});

  static String route = "/insertrule-organization";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "VISUALIZAR REGULAMENTO",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'REGULAMENTO ATUAL',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MODADLIDADE: $arg',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(width: 1),
                      color: Colors.green,
                    ),
                    child: InkWell(
                      onTap: () async {
                        try {
                          String modalityId = "";
                        await FirebaseFirestore.instance
                            .collection('modality')
                            .where('name', isEqualTo: arg!)
                            .get()
                            .then((value) {
                          modalityId = value.docs.first.id;
                        });

                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                        );

                        if (result != null) {
                          PlatformFile file = result.files.first;

                          final now = DateTime.now();
                          final uniqueFileName =
                              'meuArquivo${now.year}-${now.month}-${now.day}${now.hour}-${now.minute}-${now.second}.pdf';

                          final storageRef = FirebaseStorage.instance.ref();
                          final pdfRef =
                              storageRef.child("modalityRules/$uniqueFileName");
                          try {
                            await pdfRef.putData(file.bytes!);
                          } on FirebaseException catch (e) {}

                          final pdfUrl = await pdfRef.getDownloadURL();

                          final firestoreRef = FirebaseFirestore.instance;
                          final docRef = firestoreRef
                              .collection('modality')
                              .doc(modalityId);
                          await docRef.update({'rulesLing': pdfUrl});
                        } else {
                          // User canceled the picker
                        }
                        CustomSnackBar(message: 'PDF enviado com sucesso', ref: ref);
                        } catch (e) {
                          throw CustomSnackBar(message: 'Houve um erro', ref: ref, type: ScaffoldAlert.error);
                        }
                      },
                      child: Icon(
                        Icons.add,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'ADICIONAR REGULAMENTO',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(width: 1),
                      color: Theme.of(context).colorScheme.error,
                    ),
                    child: InkWell(
                      onTap: () async {
                        try {
                          String modalityId = "";
                        await FirebaseFirestore.instance
                            .collection('modality')
                            .where('name', isEqualTo: arg!)
                            .get()
                            .then((value) {
                          modalityId = value.docs.first.id;
                        });

                        final firestoreRef = FirebaseFirestore.instance;
                        final docRef =
                            firestoreRef.collection('modality').doc(modalityId);
                        await docRef.update({"rulesLing": null});
                        CustomSnackBar(message: 'PDF apagado com sucesso', ref: ref);
                        } catch (e) {
                          throw CustomSnackBar(message: 'Houve um erro', ref: ref, type: ScaffoldAlert.error);
                        }
                        
                      },
                      child: Icon(
                        Icons.remove,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'REMOVER REGULAMENTO',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
