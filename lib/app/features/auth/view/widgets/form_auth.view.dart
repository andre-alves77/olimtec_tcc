import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/auth/lading.store.dart';
import 'package:olimtec_tcc/app/features/auth/providers/auth_provider.dart';
import 'package:olimtec_tcc/app/features/auth/providers/state/auth_state.dart';
import 'package:olimtec_tcc/app/features/auth/view/widgets/sign_in.view.dart';
import 'package:olimtec_tcc/app/features/auth/view/widgets/sign_up.view.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class LandingTabBar extends ConsumerStatefulWidget {
  const LandingTabBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingTabBarState();
}

class _LandingTabBarState extends ConsumerState<LandingTabBar>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    /* 
    _tabController?.addListener(
      () {
        if (_tabController?.index == 1) {
          ref.read(formUserProvider).toogleAuthMode = FormUserState.SignUp;
        } else if (_tabController?.index == 0) {
          ref.read(formUserProvider).toogleAuthMode = FormUserState.SignIn;
        }
      },
    );
    _tabController?.index = 0; */
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _tabController?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final store = ref.read(formUserSignInProvider.notifier);
    bool isLoading = false;
    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          initial: (() {
            setState(() {
              isLoading = false;
            });
            Navigator.pushReplacementNamed(context, AppRoute.LANDING);
          }),
          authenticated: (user) {
            setState(() {
              isLoading = false;
            });
            Navigator.pushReplacementNamed(context, AppRoute.HOME);
            // Navigate to any screen
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Usuário autenticado'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          unauthenticated: (message) {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message!),
              behavior: SnackBarBehavior.floating,
            ));
          },
          loading: () {
            setState(() {
              isLoading = true;
            });
          });
    });
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
                    child: ref.watch(authNotifierProvider.notifier).state !=
                            const AuthenticationState.loading()
                        ? TabBarView(
                            controller: _tabController,
                            children: const [
                              SignInForm(),
                              SignUpForm(),
                            ],
                          )
                        : Container(
                            padding: const EdgeInsets.all(70),
                            alignment: Alignment.topCenter,
                            child: CircularProgressIndicator()))),
          ],
        ),
      ),
    );
  }
}