import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/admin/privileges/organization/view/privilge_organization_page.dart';
import 'package:olimtec_tcc/app/features/auth/lading.store.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';
import 'package:olimtec_tcc/app/ui/admin/management/management_account.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';


final teamstream = StreamProvider.autoDispose((ref) {
 return FirebaseFirestore.instance
     .collection('team')
     .snapshots()
     .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.data()).toList());

});


class OrganizationTeamsPrivilegesAdmin extends ConsumerWidget {
  const OrganizationTeamsPrivilegesAdmin({super.key});

  static String route = "/organization-teams-privileges-admin";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamRef = FirebaseFirestore.instance.collection('team');
    final teampod = ref.watch(teamstream);
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
        body: teampod.when(
          data: (data) {
            List widgetList = [];
            return SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: ((context, index) {
                      return Column(children: [
                        
                          CardItem(
                              data[index]['name'],
                              PrivilegeOrganization.route,
                              Theme.of(context).colorScheme.primaryContainer,
                              data[index]['image'],
                              routeArg: data[index]['name']),
                          Padding(padding: EdgeInsetsDirectional.all(8)),
                      ],);
                    }),
                  ),
                ),
              ),
            );
          },
          error: (e, s) {
            return Center(child: Text('Ocorreu um erro'));
          },
          loading: (() {
            return Center(child: CircularProgressIndicator());
          }),
        ));
  }
}
