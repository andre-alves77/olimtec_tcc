import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/models/user.model.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';
import 'package:olimtec_tcc/app/features/navigation/bottombar_store.dart';
import 'package:olimtec_tcc/app/features/navigation/bottombar_view.dart';
import 'package:olimtec_tcc/app/features/settings/settings_page.dart';
import 'package:olimtec_tcc/app/features/test.dart';
import 'package:olimtec_tcc/app/shared/views/loading_page.dart';
import 'package:olimtec_tcc/app/features/user/home/home_page.dart';
import 'package:olimtec_tcc/app/features/user/live/aovivo_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/modalities_page.dart';

class IndexHomeUser extends ConsumerWidget {
  const IndexHomeUser({super.key});
  static String route = "index";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarStore = ref.watch(bottomBarProvider);
    final appuser = ref.watch(appUserStream).when(data: (data) {
      return data;
    }, error: (error, stackTrace) {
      CustomSnackBar(
          message: "Um erro aconteceu. Tente novamente",
          ref: ref,
          type: ScaffoldAlert.error);
      return null;
    }, loading: () {
      return LoadingPage();
    });
    if (appuser is AppUser) {
      return Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomBar(),
        body: SafeArea(
          child: IndexedStack(
            index: bottomBarStore,
            children: [
              const HomeUser(),
              const ModalitiesUser(),
              const AoVivoUser(),
              SettingsPage(),
            ],
          ),
        ),
      );
    } else {
      return LoadingPage();
    }
  }
}
