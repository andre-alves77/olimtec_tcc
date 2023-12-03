import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPlayerTeam extends StatefulWidget {
  const AddPlayerTeam({super.key});

  static String route = "/addplayer-team";

  @override
  State<AddPlayerTeam> createState() => _AddPlayerTeamState();
}

class _AddPlayerTeamState extends State<AddPlayerTeam> {
  _CardJogador(String text, String image) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
              imageUrl: image,
              height: 100,
              width: sizeWidth / 8.8,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Icon(Icons.person, size: 30)),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check_outlined,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final teamRef = FirebaseFirestore.instance.collection('team');
    final usersRef = FirebaseFirestore.instance
        .collection('users')
        .where('teamName', isEqualTo: "1EAA")
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADICIONAR JOGADORES",
          style: TextStyle(
            fontFamily: 'Lato',
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: usersRef,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              } else {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: sizeWidth / 1.4,
                          child: FittedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "LISTA DE ALUNOS",
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " (2ºDSB)",
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15, 15, 15, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    width: sizeWidth / 1,
                                    height: 60,
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
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 10, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 10, 0),
                                              child: TextFormField(
                                                autofocus: true,
                                                decoration: InputDecoration(
                                                  labelText: 'Buscar Aluno',
                                                  labelStyle: const TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.search_outlined,
                                                    size: sizeWidth / 10.8,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  width: sizeWidth / 1.1,
                                  height: 590,
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
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: snapshot.data!.docs
                                        .map((DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data() as Map<String, dynamic>;
                                      return Column(
                                        children: [
                                          _CardJogador(
                                            data['name'],
                                            data['avatar'],
                                          ),
                                          Divider(
                                              height: 2,
                                              thickness: 1.5,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.all(8)),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
