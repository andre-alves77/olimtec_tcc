import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/ui/user/shared/game_card.dart';

class ModalitiesGames extends StatelessWidget {
  const ModalitiesGames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JOGOS",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text(
                    'AO VIVO',
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                      fontFamily: 'Lato',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              children: [
                Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ExpansionTile(
              title: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text(
                    'PREVISTOS',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              children: [
                Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ExpansionTile(
              title: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text(
                    'A SER CONFIRMADO',
                    style: TextStyle(
                      color: Colors.orange,
                      fontFamily: 'Lato',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              children: [
                Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
            height: 10,
          ),
            ExpansionTile(
              title: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text(
                    'ENCERRADO',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lato',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              children: [
                Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                        GestureDetector(
                          child: GameCard(gametest),
                          onTap: () {
                            Navigator.pushNamed(context, '/resultado_page');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
