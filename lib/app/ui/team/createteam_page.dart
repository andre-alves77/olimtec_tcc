import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/firebase/team.dart';
import 'package:path/path.dart' as Path;

class CreateTeam extends ConsumerWidget {
  const CreateTeam({super.key});

  static String route = "/createteam-team";

  static String imageUrl = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appuser = ref.watch(appUserStream).when(data: (data) {
      return data;
    }, error: (error, stackTrace) {
      CustomSnackBar(
          message: "Um erro aconteceu. Tente novamente",
          ref: ref,
          type: ScaffoldAlert.error);
      return null;
    }, loading: () {
      return null;
    });

    final teamImage =
        ref.watch(teamNameStream(appuser!.teamName)).whenOrNull(data: (data) {
      if (data != null) return data;
      return "minha bola";
    });

    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CONFIGURAR TIME",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SALA:",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " 3DSB",
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: sizeWidth / 3.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            width: 2,
                          )),
                      child: FittedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: CachedNetworkImage(
                              imageUrl: teamImage!,
                              //"https://firebasestorage.googleapis.com/v0/b/olimtec-59335.appspot.com/o/teamName%2Fchannels4_profile.jpg?alt=media&token=ebdb650a-e6c3-4856-96b3-640ed6a4c4ba",
                              width: sizeWidth / 2,
                              height: sizeWidth / 2,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.shield, size: 200)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: sizeWidth / 1.8,
                            child: FittedBox(
                              child: Text(
                                "ADICIONAR BRASÃO",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: sizeWidth / 1.8,
                            child: FittedBox(
                              child: Text(
                                "DIMENSÕES: 250 X 250",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: sizeWidth / 1.8,
                            child: FittedBox(
                                child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () async {
                                Future<String> uploadImageToStorage(
                                    PlatformFile file) async {
                                  var uploadedPhotoUrl;
                                  Reference _reference =
                                      FirebaseStorage.instance.ref().child(
                                          'teamName/${Path.basename(file.name)}');
                                  await _reference
                                      .putData(
                                    file.bytes!,
                                    SettableMetadata(contentType: 'image/jpeg'),
                                  )
                                      .whenComplete(() async {
                                    await _reference
                                        .getDownloadURL()
                                        .then((value) {
                                      uploadedPhotoUrl = value;
                                    });
                                  });
                                  return uploadedPhotoUrl;
                                }

                                ImagePicker? _picker;
                                dynamic file;
                                if (kIsWeb) {
                                  FilePickerResult? result =
                                      await appuser.pickImage();
                                  if (result != null) {
                                    PlatformFile file = result.files.first;
                                    String? imageUrl =
                                        await uploadImageToStorage(file);
                                    print('Image uploaded to: $imageUrl');

                                    var doc;
                                    var query = await FirebaseFirestore.instance
                                        .collection('team')
                                        .where("name",
                                            isEqualTo: appuser.teamName)
                                        .get();

                                    for (var x in query.docs) {
                                      doc = x.id;
                                    }

                                    try {
                                      FirebaseFirestore db =
                                          FirebaseFirestore.instance;
                                      DocumentReference docRef =
                                          db.collection('team').doc(doc);

                                      await docRef.update({
                                        'image': imageUrl,
                                      });
                                    } catch (error) {
                                      print(error);
                                    }
                                  }
                                } else {
                                  //MOBILE
                                  _picker = ImagePicker();
                                  file = await _picker.pickImage(
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
                                      referenceRoot.child('teamImage');

                                  //Create a reference for the image to be stored
                                  Reference referenceImageToUpload =
                                      referenceDirImages.child(uniqueFileName);

                                  //Handle errors/success
                                  try {
                                    //Store the file
                                    await referenceImageToUpload
                                        .putFile(File(file!.path));
                                    //Success: get the download URL
                                    imageUrl = await referenceImageToUpload
                                        .getDownloadURL();
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
                                  print(appuser.id);
                                  var query = await FirebaseFirestore.instance
                                      .collection('team')
                                      .where("name",
                                          isEqualTo: appuser.teamName)
                                      .get();

                                  for (var x in query.docs) {
                                    doc = x.id;
                                  }

                                  try {
                                    FirebaseFirestore db =
                                        FirebaseFirestore.instance;
                                    DocumentReference docRef =
                                        db.collection('team').doc(doc);

                                    await docRef.update({
                                      'image': imageUrl,
                                    });
                                  } catch (error) {
                                    print(error);
                                  }
                                }
                                final snackBar = SnackBar(
                                  content: Text('Espere um instante'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: FittedBox(
                                child: Text(
                                  "Adicionar brasão",
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: SizedBox(
                  width: sizeWidth / 2,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: const Color(0xFFEDEDED),
                    ),
                    child: const FittedBox(
                      child: Text(
                        "SALVAR TIME",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
