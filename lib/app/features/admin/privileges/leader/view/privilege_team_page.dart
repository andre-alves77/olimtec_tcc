import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/auth/models/user.model.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';

class PrivilegeTeamAdmin extends ConsumerWidget {
  const PrivilegeTeamAdmin({super.key});

  static String route = "/privilegesteampage-admin";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final sizeHeight = min(MediaQuery.of(context).size.height, 400).toDouble();

    final String? arg = ModalRoute.of(context)?.settings.arguments as String;
    final usersRef = FirebaseFirestore.instance
        .collection("users")
        .where('teamName', isEqualTo: arg);

    final appuser = ref.watch(appUserStream).when(
        data: (data) {
          return data;
        },
        error: (error, stackTrace) {},
        loading: () {});

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REPRESENTANTES - $arg",
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
                                arg ?? 'TIME',
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
                            Text(
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
                                      return Text('Deu ruim');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        ],
                                      );
                                    }

                                    List<DocumentSnapshot> leaders = [];
                                    List<DocumentSnapshot> others = [];
                                    snapshot.data!.docs.forEach((document) {
                                      var data = document.data()
                                          as Map<String, dynamic>;
                                      if (data['isLeader'] ?? false) {
                                        leaders.add(document);
                                      } else {
                                        others.add(document);
                                      }
                                      print("DJ MEC MEC");
                                    });

                                    // Concatenar as duas listas
                                    List<DocumentSnapshot> sortedDocs = [
                                      ...leaders,
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
                                                      BorderRadius.circular(80),
                                                  child: CachedNetworkImage(
                                                      imageUrl: data['avatar'],
                                                      width: 60,
                                                      height: 60,
                                                      fit: BoxFit.cover,
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.person, size: 60))),
                                              title: Text(data['name']),
                                              trailing: Container(
                                                width: sizeWidth / 7.8,
                                                child: FittedBox(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        final appUser =
                                                            AppUser.fromMap(
                                                                data);
                                                        if (data['isLeader'] ==
                                                            true) {
                                                          appUser.isLeader =
                                                              false;
                                                        } else {
                                                          appUser.isLeader =
                                                              true;
                                                        }
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection("users")
                                                            .doc(document.id)
                                                            .set(appUser
                                                                .toMap());
                                                      },
                                                      icon: data['isLeader'] ==
                                                              true
                                                          ? Icon(
                                                              Icons.remove,
                                                              color: Colors.red,
                                                            )
                                                          : Icon(Icons.add)),
                                                ),
                                              ),
                                            ),
                                            Divider(),
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
