import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ResponsiveBottom extends StatefulWidget {
  const ResponsiveBottom({super.key});

  @override
  State<ResponsiveBottom> createState() => _ResponsiveBottomState();
}

class _ResponsiveBottomState extends State<ResponsiveBottom> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class GBottom extends StatefulWidget {
  const GBottom({super.key});

  @override
  State<GBottom> createState() => _GBottomState();
}

class _GBottomState extends State<GBottom> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: GNav(
        tabMargin: EdgeInsets.all(0),
        gap: 8,
        padding: const EdgeInsets.all(20),
        rippleColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        activeColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        iconSize: 25,
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: "Home",
          ),
          GButton(
            icon: Icons.sports_basketball_outlined,
            text: "Modalidades",
          ),
          GButton(
            icon: Icons.live_tv,
            text: "Ao vivo",
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: "Config",
          ),
        ],
      ),
    );
  }
}
