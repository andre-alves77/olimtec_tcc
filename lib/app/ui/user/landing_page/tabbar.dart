import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/ui/user/landing_page/cadastro.dart';
import 'package:olimtec_tcc/app/ui/user/landing_page/login.dart';

class LandingTabBar extends StatefulWidget {
  const LandingTabBar({super.key});

  @override
  State<LandingTabBar> createState() => _LandingTabBarState();
}

class _LandingTabBarState extends State<LandingTabBar>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: Column(
          children: [
            Align(
              alignment: const Alignment(0, 0),
              child: Container(
                width: sizeWidth / 1.5,
                child: FittedBox(
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Theme.of(context).colorScheme.primary,
                    unselectedLabelColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    labelPadding:
                        const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                    labelStyle: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    indicatorColor: Colors.white,
                    tabs: const [
                      Tab(
                        text: 'ENTRAR',
                      ),
                      Tab(
                        text: ' CRIAR CONTA ',
                      ),
                    ],
                    controller: _tabController,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Form(
                      child: LoginTabBarView(),
                    ),
                    Form(
                      child: CadastroTabBar(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
