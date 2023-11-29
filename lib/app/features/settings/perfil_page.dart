import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PerfilUser extends ConsumerWidget {
  const PerfilUser({super.key});

  static String route = "/perfil-user";

  static const String imageUrl = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final sizeHeight = min(MediaQuery.of(context).size.height, 400).toDouble();
    final email = ref.read(authRepositoryProvider).auth.currentUser?.email;
    final appuser = ref.watch(appUserStream).when(
        data: (data) {
          return data;
        },
        error: (error, stackTrace) {},
        loading: () {});
    String imageUrl = '';
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          "MEU PERFIL",
          style: TextStyle(
            fontFamily: 'Lato',
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: CachedNetworkImage(
                        imageUrl: appuser!.avatar,
                        width: sizeWidth / 2,
                        height: sizeHeight / 2,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.person, size: 60)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: sizeWidth / 2.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () async {
                          ImagePicker? _picker;
                          dynamic file;
                          dynamic ob;
                          if (kIsWeb) {
                            FilePickerResult? result =
                                await appuser?.pickImage();
                            if (result != null) {
                              PlatformFile file = result.files.first;
                              String? imageUrl =
                                  await appuser?.uploadImageToStorage(file);
                              print('Image uploaded to: $imageUrl');

                              var doc;
                              var query = await FirebaseFirestore.instance
                                  .collection('users')
                                  .where("id", isEqualTo: appuser?.id)
                                  .get();

                              for (var x in query.docs) {
                                doc = x.id;
                              }

                              try {
                                FirebaseFirestore db =
                                    FirebaseFirestore.instance;
                                DocumentReference docRef =
                                    db.collection('users').doc(doc);

                                await docRef.update({
                                  'avatar': imageUrl,
                                });
                              } catch (error) {
                                print(error);
                              }
                            }
                          } else {
                            //MOBILE
                            _picker = ImagePicker();
                            file = await _picker?.pickImage(
                                source: ImageSource.gallery);
                            if (file == null) return;
                            print('${file.path}');

                            //Import dart:core
                            String uniqueFileName = DateTime.now()
                                .millisecondsSinceEpoch
                                .toString();

                            /*Step 2: Upload to Firebase storage*/
                            //Install firebase_storage
                            //Import the library

                            //Get a reference to storage root
                            Reference referenceRoot =
                                FirebaseStorage.instance.ref();
                            Reference referenceDirImages =
                                referenceRoot.child('avatar');

                            //Create a reference for the image to be stored
                            Reference referenceImageToUpload =
                                referenceDirImages.child(uniqueFileName);

                            //Handle errors/success
                            try {
                              //Store the file
                              await referenceImageToUpload
                                  .putFile(File(file!.path));
                              //Success: get the download URL
                              imageUrl =
                                  await referenceImageToUpload.getDownloadURL();
                            } catch (error) {
                              //Some error occurred
                              print(error);
                            }

                            File _file = File(file!.path);

                            try {
                              await referenceImageToUpload.putFile(
                                  _file,
                                  SettableMetadata(
                                    contentType: "image/jpeg",
                                  ));
                            } catch (error) {
                              print(error);
                            }

                            var doc;
                            print(appuser?.id);
                            var query = await FirebaseFirestore.instance
                                .collection('users')
                                .where("id", isEqualTo: appuser?.id)
                                .get();

                            for (var x in query.docs) {
                              doc = x.id;
                            }

                            try {
                              FirebaseFirestore db = FirebaseFirestore.instance;
                              DocumentReference docRef =
                                  db.collection('users').doc(doc);

                              await docRef.update({
                                'avatar': imageUrl,
                              });
                            } catch (error) {
                              print(error);
                            }
                          }
                        },
                        child: const FittedBox(
                          child: Text(
                            "Alterar Foto",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: sizeWidth / 2.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                        onPressed: () async {
                          FirebaseFirestore db = FirebaseFirestore.instance;

                          var doc;
                          print(appuser?.id);
                          var query = await FirebaseFirestore.instance
                              .collection('users')
                              .where("id", isEqualTo: appuser?.id)
                              .get();

                          for (var x in query.docs) {
                            doc = x.id;
                          }

                          String uniqueFileName =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          Reference referenceRoot =
                              FirebaseStorage.instance.ref();
                          Reference referenceDirImages =
                              referenceRoot.child('avatar');

                          DocumentReference docRef =
                              db.collection('users').doc(doc);
                          //Get a reference to the image to be deleted
                          Reference referenceImageToDelete =
                              referenceDirImages.child(uniqueFileName);

                          //Delete the image from Firebase Storage
                          try {
                            await referenceImageToDelete.delete();
                          } catch (error) {
                            print(error);
                          }

                          //Update Firestore to reflect the deletion of the photo
                          try {
                            await docRef.update({
                              'avatar': 'assets/images/LOGO_USUARIO.png',
                            });
                          } catch (error) {
                            print(error);
                          }
                        },
                        child: const FittedBox(
                          child: Text(
                            "Remover Foto",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: sizeWidth / 5.2,
                          child: const FittedBox(
                            child: Text(
                              'NOME:',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                            child: Container(
                              width: sizeWidth / 2,
                              child: TextFormField(
                                initialValue: appuser?.name,
                                autofocus: true,
                                readOnly: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontSize: 16,
                                  ),
                                  hintStyle: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontSize: 16,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: sizeWidth / 5.2,
                          child: const FittedBox(
                            child: Text(
                              'EMAIL:',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                            child: Container(
                              width: sizeWidth / 2,
                              child: TextFormField(
                                initialValue: email,
                                autofocus: true,
                                readOnly: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontSize: 16,
                                  ),
                                  hintStyle: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontSize: 16,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: sizeWidth / 5.2,
                          child: const FittedBox(
                            child: Text(
                              'SALA:',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                            child: Container(
                              width: sizeWidth / 2,
                              child: TextFormField(
                                initialValue: appuser.teamName,
                                autofocus: true,
                                readOnly: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontSize: 16,
                                  ),
                                  hintStyle: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontSize: 16,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
