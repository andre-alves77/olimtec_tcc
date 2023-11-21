import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';
import 'package:olimtec_tcc/app/ui/admin/management/management_account.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class OrganizationTeamsPrivilegesAdmin extends StatelessWidget {
  const OrganizationTeamsPrivilegesAdmin({super.key});

  static String route = "/organization-teams-privileges-admin";

  @override
  Widget build(BuildContext context) {
    final teamRef = FirebaseFirestore.instance.collection('team');
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ORGANIZADORES",
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
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: teamRef.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
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
                                  AppRoute.PRIVILEGESTEAMPAGE_ADMIN,
                                  Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  data['image']),
                              Padding(padding: EdgeInsetsDirectional.all(8)),
                            ],
                          );
                        }).toList(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
