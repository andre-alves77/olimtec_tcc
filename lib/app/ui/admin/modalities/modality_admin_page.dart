import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';

class ModalityAdminPage extends StatelessWidget {
  const ModalityAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BASQUETE MASCULINO",
              style: TextStyle(
                fontFamily: 'Lato',
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/team_admin');
                    },
                    child: OptionConfig(
                        icone: Icons.shield_outlined,
                        text1: "VISUALIZAR EQUIPES",
                        text2: "(PARTICIPANTES)"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/modalities_games');
                    },
                    child: OptionConfig(
                        icone: Icons.remove_red_eye, text1: "VISUALIZAR JOGOS"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'regulation_admin');
                    },
                    child: OptionConfig(
                        icone: Icons.rule, text1: "VISUALIZAR REGULAMENTO"),
                  ),
                  OptionConfig(
                      icone: Icons.account_tree,
                      text1: "VISUALIZAR CHAVEAMENTO"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
