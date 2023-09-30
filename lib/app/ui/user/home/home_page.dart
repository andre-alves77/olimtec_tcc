import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/app.dart';
import 'package:olimtec_tcc/app/features/navigation/bottombar_store.dart';
import 'package:olimtec_tcc/app/features/theme/theme_store.dart';
import 'package:olimtec_tcc/app/ui/user/shared/game_card.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:provider/provider.dart';

import 'card_carousel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _bottomBarStore = ref.watch(bottomBarProvider);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        actions: [
          /* IconButton(
            onPressed: (() => context.read<ThemeStore>().toggle()),
            icon: context.read<ThemeStore>().value == ThemeMode.dark
                ? Icon(
                    Icons.nightlight_outlined,
                    color: Theme.of(context).colorScheme.onBackground,
                  )
                : const Icon(Icons.light_mode_outlined),
          ) */
        ],
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
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Column(
                children: [
                  Container(
                    constraints:
                        const BoxConstraints(maxWidth: 400, minWidth: 200),
                    child: const CardCarousel(),
                  ),
                  const FittedBox(
                      child: Text(
                    'RESULTADOS',
                    style:
                        TextStyle(fontSize: 26.1, fontWeight: FontWeight.bold),
                  )),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        GameCard(gametest),
                        GameCard(gametest),
                        GameCard(gametest),
                        GameCard(gametest),
                        GameCard(gametest),
                        GameCard(gametest),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
