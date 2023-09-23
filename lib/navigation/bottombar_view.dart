// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/app.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:olimtec_tcc/navigation/bottombar_store.dart';

class BottomBar extends ConsumerWidget {
  BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarStore = ref.watch(bottomBarProvider.notifier);
    return SalomonBottomBar(
      currentIndex: bottomBarStore.state,
      onTap: (newIndex) {
        bottomBarStore.setIndex(newIndex);
        print(bottomBarStore.state);
      },
      items: [
        bottombaritem(
          context: context,
          title: 'Home',
          iconData: Icons.home,
        ),
        bottombaritem(
          context: context,
          title: 'Modalidades',
          iconData: Icons.sports_basketball,
        ),
        bottombaritem(
          context: context,
          title: "Ao vivo",
          iconData: Icons.live_tv,
        ),
        bottombaritem(
            context: context,
            title: "Configuraçãoes",
            iconData: Icons.settings),
      ],
    );
  }

  SalomonBottomBarItem bottombaritem(
      {required BuildContext context,
      required String title,
      required IconData iconData}) {
    return SalomonBottomBarItem(
      title: Text(title),
      icon: Icon(iconData),
      selectedColor: Theme.of(context).colorScheme.primary,
    );
  }
}
