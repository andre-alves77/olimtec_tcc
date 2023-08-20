import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/components/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';

class MainAoVivo extends StatefulWidget {
  const MainAoVivo({super.key});

  @override
  State<MainAoVivo> createState() => _MainAoVivoState();
}

class _MainAoVivoState extends State<MainAoVivo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          automaticallyImplyLeading: false,
          leading: Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(),
            child: ClipRRect(
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
          ),
          centerTitle: true,
          title: Text(
            'AO VIVO',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: Column(
                        children: [
                          GameCard(gametest),
                          GameCard(gametest),
                          GameCard(gametest),
                          GameCard(gametest),
                          GameCard(gametest),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }
}
