import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/components/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/navigation/navigation_view.dart';

import '../components/card_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: GBottom(),
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
              'OLIM',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'TEC',
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 400, minWidth: 200),
                child: CardCarousel(),
              ),
              FittedBox(
                  child: Text(
                'RESULTADOS',
                style: TextStyle(fontSize: 26.1, fontWeight: FontWeight.bold),
              )),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: ListView.builder(
                      itemCount: games.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: GameCard(games[index]),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/resultado_page',
                            );
                          },
                        );
                      }),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
