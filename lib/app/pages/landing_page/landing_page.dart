import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/pages/landing_page/tabbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/trio_absurdo_login.jpg',
            ).image,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0x990F1113),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_principal_dark_mode.png',
                  width: sizeWidth / 1.5,
                  height: 155,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: sizeWidth / 2,
                  child: FittedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "OLIM",
                          style: TextStyle(
                            color: Color(0xFFEDEDED),
                            fontFamily: 'Lato',
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "TEC",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: 'Lato',
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: sizeWidth / 1.2,
                    child: FittedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "SINTA A EXPERIÊNCIA OLÍMPICA",
                            style: TextStyle(
                              color: Color(0xFFEDEDED),
                              fontFamily: 'Lato',
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                LandingTabBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
