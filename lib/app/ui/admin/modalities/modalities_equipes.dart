import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modality_team_view.dart';

class TeamAdmin extends StatelessWidget {
  const TeamAdmin({super.key});

  static String route = "/team-admin";

  @override
  Widget build(BuildContext context) {
    final teamRef = FirebaseFirestore.instance.collection('team');
    final String arg = ModalRoute.of(context)?.settings.arguments as String;
    // final gamesRef = FirebaseFirestore.instance
    //     .collection("team")
    //     .where('name', isEqualTo: arg).get().then((value) {return value;});
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          arg,
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
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    child: Column(children: [
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
                                CardItem(
                                    data['name'],
                                    TeamViewAdmin.route,
                                    Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    data['image'],
                                    routeArg: data["name"]),
                                Padding(padding: EdgeInsetsDirectional.all(8)),
                              ],
                            );
                          }).toList(),
                        );
                      }
                    },
                  )
                ]))))
    );
  }
}
