import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/providers/navigatorkey.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/features/auth/view/landing_page.view.dart';
import 'package:olimtec_tcc/app/features/championship/service/championship.service.dart';
import 'package:olimtec_tcc/app/features/championship/views/initial_config/start_championship.dart';
import 'package:olimtec_tcc/app/shared/views/loading_page.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/ui/admin/management/main_management.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modalities_page.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/main_privileges_admin.dart';

final mainAdminProvider = StateProvider.autoDispose((ref) {
  final champs = ref.watch(championshipStreamProvider);
  final context = ref.read(navigtorkeyProvider).currentContext;
  
  champs.when(
    data: (value) {
      if (value == null) {
        Navigator.popAndPushNamed(context!, LandingPage.route);
      }
      if (value!.isCreated) {
        Navigator.popAndPushNamed(context!, MainAdmin2.route);
      }
      if (value.isCreated == false) {
        Navigator.popAndPushNamed(context!, StartChampionshipAdmin.route);
      }
    },
    error: (e, s) {},
    loading: () {},
  );
});

final isCreatedProvider = StreamProvider.autoDispose<DocumentSnapshot>((ref) {
 return FirebaseFirestore.instance
     .collection('championship')
     .doc('MTayq9MuIFOUqqBsgWTQ')
     .snapshots();
});


class MainAdmin extends ConsumerWidget {
  const MainAdmin({super.key});

  static String route = "/main-admin";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mainAdminProvider);

    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class MainAdmin2 extends ConsumerWidget {
  const MainAdmin2({super.key});

  static String route = "/main-admin2";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    return ref.watch(isCreatedProvider).when(data: (data){
      if(data['isCreated']){
  return  Scaffold(
      appBar: AppBar(
        title: Text(
          'ADMIN',
          style: TextStyle(
            fontFamily: 'Lato',
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MainPrivilegeAdmin.route);
                },
                child: OptionConfig(
                    icone: Icons.star,
                    text1: "PRIVILÉGIOS ",
                    text2: "(UNICOS DO ADMINISTRADOR)"),
              ),
            // Padding(padding: EdgeInsets.all(15)),
            //   GestureDetector(
            //     onTap: () {
            //       Navigator.pushNamed(context, '/');
            //     },
            //     child: GestureDetector(
            //       onTap: () {
            //         Navigator.pushNamed(context, MainManagementAdmin.route);
            //       },
            //       child: OptionConfig(
            //           icone: Icons.library_books,
            //           text1: "GERENCIAMENTO ",
            //           text2: "(DE CADA MODALIDADE)"),
            //     ),
            //   ),
                            Padding(padding: EdgeInsets.all(15)),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushNamed(context, ModalitiesAdmin.route);
              //   },
              //   child: OptionConfig(
              //       icone: Icons.sports_basketball,
              //       text1: "MODALIDADES",
              //       text2: "(TODAS AS MODALIDADES)"),
              // ),
                GestureDetector(onTap: () {
                  showAdaptiveDialog(context: context, builder: ((context) {
                    return AlertDialog.adaptive(actions: [
                      TextButton(onPressed: (){
Navigator.pop(context, true);
                      }, child: Text('CANCELAR')),
TextButton(onPressed: (() async{
  try{
      final instance = FirebaseFirestore.instance;
      final batch = instance.batch();

      var collection = instance.collection('team');
      var snapshots = await collection.get();

      for (var doc in snapshots.docs) {
        batch.delete(doc.reference);
      }

      var collection2 = instance.collection('game');
      var snapshots2 = await collection2.get();

      for (var doc in snapshots2.docs) {
        batch.delete(doc.reference);
      }

      var collection3 = instance.collection('modality');
      var snapshots3 = await collection3.get();

      for (var doc in snapshots3.docs) {
        batch.delete(doc.reference);
      }

      var collection4 = instance.collection('local');
      var snapshots4 = await collection4.get();

      for (var doc in snapshots4.docs) {
        batch.delete(doc.reference);
      }

  ref.read(authRepositoryProvider).deleteAllUsersTeams();
      

      await batch.commit();
  await FirebaseFirestore.instance.collection('championship').doc("MTayq9MuIFOUqqBsgWTQ").update({'isCreated':false});

  ref.read(authRepositoryProvider).signOut();
  }catch(e){

  }
}), child: Text('ENCERRAR'))
                    ],title: Text('REINICIAR OLIMPÍADAS'),);
                    
                  }));
                },child: OptionConfig(icone: Icons.restart_alt, text1: "REINICIAR CAMPEONATO")),
              Padding(padding: EdgeInsets.all(15)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onPressed: () {
          ref.read(authRepositoryProvider).signOut();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
      }
   return StartChampionshipAdmin();
    }, error: ((error, stackTrace) {
      return Scaffold(body: Center(child: Text('Ocorreu um erro'),));
    }), loading: (() {
    return LoadingPage();  
    }));
  }
}
