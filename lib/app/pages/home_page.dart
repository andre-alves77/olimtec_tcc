import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/components/game_card.dart';

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
        title: const Text(
          'HOMEPAGE',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CardCarousel(),
          Text(
            'RESULTADOS',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                GameCard(),
              ],
            ),
          ),
        ],
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
