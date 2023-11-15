import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth_checker.dart';
import 'package:olimtec_tcc/app/features/auth/view/landing_page.view.dart';
import 'package:olimtec_tcc/app/features/navigation/bottombar_store.dart';
import 'package:olimtec_tcc/app/features/navigation/bottombar_view.dart';
import 'package:olimtec_tcc/app/features/settings/settings_page.dart';
import 'package:olimtec_tcc/app/ui/user/home/home_page.dart';
import 'package:olimtec_tcc/app/ui/user/live/aovivo_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/modalities_page.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class IndexHomeUser extends ConsumerWidget {
  const IndexHomeUser({super.key});
  static String route = "index";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarStore = ref.watch(bottomBarProvider);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: IndexedStack(
          index: bottomBarStore,
          children: const [
            HomeUser(),
            ModalitiesUser(),
            AoVivoUser(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
