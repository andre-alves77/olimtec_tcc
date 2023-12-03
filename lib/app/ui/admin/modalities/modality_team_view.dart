import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TeamViewAdmin extends StatefulWidget {
  const TeamViewAdmin({super.key});

  static String route = "/teamview-admin";

  @override
  State<TeamViewAdmin> createState() => _TeamViewAdminState();
}

class _TeamViewAdminState extends State<TeamViewAdmin> {
  _CardJogador() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            'assets/images/LOGO_USUARIO.png',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'Fulano de tal',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final teamRef = FirebaseFirestore.instance.collection('team');
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;
    final gamesRef = FirebaseFirestore.instance
        .collection("modality")
        .where('name', isEqualTo: arg);
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
        appBar: AppBar(
          title:  Text(
            "$arg",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        arg ?? 'TIME',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                  FittedBox(
                    child: Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/LOGO_2DSB_EXAMPLE.png',
                          width: 170,
                          height: 170,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FittedBox(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'PARTICIPANTES',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 2,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  constraints: BoxConstraints(maxWidth: sizeWidth),
                  height: 400,
                  child: ListView(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                    stream: teamRef.snapshots(),
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
                        return ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return Column(
                              children: [
                                Padding(padding: EdgeInsetsDirectional.all(8)),
                              ],
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                      Divider(
                          height: 2,
                          thickness: 1.5,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
