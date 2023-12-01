import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/ui/shared/modalityItem_card.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/sport_modalitiy_page.dart';

class ModalitiesUser extends StatelessWidget {
  const ModalitiesUser({super.key});

  static String route = "/modalities-user";

  @override
  Widget build(BuildContext context) {
    final modalitiesRef = FirebaseFirestore.instance.collection('modality');
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        automaticallyImplyLeading: false,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            Theme.of(context).brightness == Brightness.light
                ? 'assets/images/LOGO_LIGHT_MODE.png'
                : 'assets/images/LOGO_DARK_MODE.png',
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'MODALIDADES',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          alignment: Alignment.topCenter,
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: modalitiesRef.snapshots(),
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
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ESPORTE DE QUADRA',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['category'] == "quadra") {
                            return ModalityItemCard(
                              routes: ModalityUser.route,
                              modalityName: data['name'],
                              iconName: data['icon'],
                            );
                          }
                          return SizedBox(
                            height: 0,
                            width: 0,
                          );
                        }).toList(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'DANÇA',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['category'] == "dança") {
                            return ModalityItemCard(
                              routes: ModalityUser.route,
                              modalityName: data['name'],
                              iconName: data['icon'],
                            );
                          }
                          return SizedBox(
                            height: 0,
                            width: 0,
                          );
                        }).toList(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'JOGOS DE MESA',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['category'] == "jogos de mesa") {
                            return ModalityItemCard(
                              routes: ModalityUser.route,
                              modalityName: data['name'],
                              iconName: data['icon'],
                            );
                          }
                          return SizedBox(
                            height: 0,
                            width: 0,
                          );
                        }).toList(),
                         Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'E-SPORTS',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['category'] == "e-sports") {
                            return ModalityItemCard(
                              routes: ModalityUser.route,
                              modalityName: data['name'],
                              iconName: data['icon'],
                            );
                          }
                          return SizedBox(
                            height: 0,
                            width: 0,
                          );
                        }).toList(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'OUTROS',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          if (data['category'] == "outros") {
                            return ModalityItemCard(
                              routes: ModalityUser.route,
                              modalityName: data['name'],
                              iconName: data['icon'],
                            );
                          }
                          return SizedBox(
                            height: 0,
                            width: 0,
                          );
                        }).toList(),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
