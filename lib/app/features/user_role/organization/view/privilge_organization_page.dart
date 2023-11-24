import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/features/auth/models/user.model.dart';

class PrivilegeOrganization extends StatefulWidget {
  const PrivilegeOrganization({super.key});

  static String route = "/privilegeorganization-admin";

  @override
  State<PrivilegeOrganization> createState() => _PrivilegeOrganizationState();
}

class _PrivilegeOrganizationState extends State<PrivilegeOrganization> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final sizeHeight = min(MediaQuery.of(context).size.height, 400).toDouble();
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;

    final usersRef = FirebaseFirestore.instance
        .collection("users")
        .where('teamName', isEqualTo: arg);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ORGANIZADORES - $arg",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: sizeWidth / 4.2,
                            child: FittedBox(
                              child: Text(
                                arg ?? "TIME",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth / 1.2,
                            child: Divider(
                              thickness: 2,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: sizeWidth / 1.2,
                      child: FittedBox(
                        child: Column(
                          children: [
                            const Text(
                              "ALUNOS",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "INSIRA OS REPRESENTANTES ABAIXO",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              width: sizeWidth / 1.1,
                              height: sizeHeight * 0.6,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  width: 2,
                                ),
                              ),
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: usersRef.snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return const Text('Deu ruim');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        ],
                                      );
                                    }

                                    List<DocumentSnapshot> orgs = [];
                                    List<DocumentSnapshot> others = [];
                                    snapshot.data!.docs.forEach((document) {
                                      var data = document.data()
                                          as Map<String, dynamic>;
                                      if (data['isOrganization'] ?? false) {
                                        orgs.add(document);
                                      } else {
                                        others.add(document);
                                      }
                                      print("DJ MEC MEC");
                                    });

                                    // Concatenar as duas listas
                                    List<DocumentSnapshot> sortedDocs = [
                                      ...orgs,
                                      ...others
                                    ];

                                    return ListView(
                                      children: sortedDocs
                                          .map((DocumentSnapshot document) {
                                        Map<String, dynamic> data = document
                                            .data() as Map<String, dynamic>;

                                        return Column(
                                          children: [
                                            ListTile(
                                              leading: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.asset(
                                                  'assets/images/LOGO_USUARIO.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              title: Text(data['name']),
                                              trailing: Container(
                                                width: sizeWidth / 7.8,
                                                child: FittedBox(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        final appUser =
                                                            AppUser.fromMap(
                                                                data);
                                                        if (data[
                                                                'isOrganization'] ==
                                                            true) {
                                                          appUser.isOrganization =
                                                              false;
                                                        } else {
                                                          appUser.isOrganization =
                                                              true;
                                                        }
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection("users")
                                                            .doc(document.id)
                                                            .set(appUser
                                                                .toMap());
                                                        setState(() {});
                                                      },
                                                      icon:
                                                          data['isOrganization'] ==
                                                                  true
                                                              ? const Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .red,
                                                                )
                                                              : const Icon(
                                                                  Icons.add)),
                                                ),
                                              ),
                                            ),
                                            const Divider(),
                                          ],
                                        );
                                      }).toList(),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
