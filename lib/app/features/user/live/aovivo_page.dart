import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/service/game.service.dart';
import 'package:olimtec_tcc/app/features/test.dart';
import 'package:olimtec_tcc/app/ui/user/shared/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/ui/user/shared/resultado_page.dart';

class AoVivoUser extends ConsumerWidget {
  const AoVivoUser({super.key});

  static String route = "/aovivo-user";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String>? gameList = ref.watch(inProgressGamesProvider).whenData((value) => value).value;
    List<Widget> widgetList = []; 
    gameList!.forEach((element) {
      widgetList.add(GameCardStream(docId: element));
    });

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
                'AO VIVO',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        body: Center(
          child: ListView(padding: EdgeInsets.zero, primary: false, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(children: widgetList,),
                  ),
                  const SizedBox(height: 10),
              ],
            ),
          ]),
        ));
  }
}
