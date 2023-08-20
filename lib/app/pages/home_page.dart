import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/components/game_card.dart';
import 'package:olimtec_tcc/app/components/main_card.dart';
import 'package:olimtec_tcc/app/components/test_widget.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';

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
        title: Center(
          child: Row(
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
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 400, minWidth: 200),
              child: CardCarousel(),
            ),
            FittedBox(
                child: Text(
              'RESULTADOS',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )),
            Expanded(
              child: Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: ListView.builder(
                    itemCount: games.length,
                    itemBuilder: (context, index) {
                      return GameCard(games[index]);
                    }),
              ),
            ),
            SizedBox(height: 10), 
          ],
        ),
      ),
    );
  }
}

class bottomtest extends StatelessWidget {
  const bottomtest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_basketball), label: 'Modalidades'),
        BottomNavigationBarItem(
            icon: Icon(Icons.center_focus_weak_rounded), label: 'Ao vivo'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Configurações'),
      ],
    );
  }
}

class MainCardTest extends StatelessWidget {
  const MainCardTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }
}
