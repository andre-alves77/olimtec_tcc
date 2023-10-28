import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/features/auth/view/landing_page.view.dart';
import 'package:olimtec_tcc/app/ui/user/index_home_user.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

/* class AuthChecker extends ConsumerWidget {
  const AuthChecker(this.child, {super.key});

  final child;
  static String route = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    ref.listen(authStateProvider, (previous, next) {
      
    });

    return child;
    return authState.when(
      data: (user) {
        print(user?.email);
        if (user != null) {
          return const IndexHomeUser();
        }
        return const LandingPage();
      },
      loading: () {
        return const LandingPage();
      },
      error: (e, trace) {
        return const LandingPage();
      },
    );
  }
} */

// ignore: must_be_immutable
/* class AuthChecker extends ConsumerWidget {
  Widget child;
  AuthChecker({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final islogged = ref.read(isLoggedProvider);

    if (!islogged) {
      Navigator.pushReplacementNamed(context, AppRoute.LANDING);
    }
    return child;
  }
}
 */