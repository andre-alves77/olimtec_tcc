import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/service/game.service.dart';
import 'package:olimtec_tcc/app/features/organization/start_games/startgame_card.dart';
import 'package:olimtec_tcc/app/features/test.dart';

class ModalityOrganization extends ConsumerWidget {
  const ModalityOrganization({super.key});

  static String route = "/modalitypage-organization";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? argModality =
        ModalRoute.of(context)?.settings.arguments as String;
    List<String>? gameList = ref
            .watch(pendentDocORDERIdsProvider(argModality!))
            .whenData((value) => value)
            .value ??
        [];

    List<Widget> widgetList = [];
    gameList.forEach((element) {
      print(element);
      widgetList.add(StartGameCardStream(docId: element));
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: FittedBox(
          child: Text(
            "${argModality.toUpperCase()}",
            style: TextStyle(
              fontFamily: 'Lato',
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints(maxWidth: 400),
        child: ListView(
          children: [...widgetList],
        ),
      ),
    );
  }
}
