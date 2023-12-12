import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/features/admin/privileges/leader/view/privilege_team_page.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';
import 'package:olimtec_tcc/app/ui/admin/management/management_account.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class LeaderTeamsPrivilegesAdmin extends StatelessWidget {
  const LeaderTeamsPrivilegesAdmin({super.key});

  static String route = "/leader-teams-privileges-admin";

  @override
  Widget build(BuildContext context) {
    final teamRef = FirebaseFirestore.instance.collection('team');
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "REPRESENTANTES",
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

                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return Column(
                              children: [
                                CardItem(
                                    data['name'],
                                    PrivilegeTeamAdmin.route,
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
                ])))));
  }
}
