import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/providers/navigatorkey.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/lading.store.dart';
import 'package:olimtec_tcc/app/features/auth/repository/auth.repository.dart';
import 'package:olimtec_tcc/app/ui/user/index_home_user.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(FirebaseAuth.instance, ref);
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChange;
});

final isLoggedProvider = StateProvider<bool>((ref) {
  return ref.watch(authStateProvider).when(
    loading: () {
      ref.read(formUserSignInProvider).isLoading = true;

      debugPrint("carregando login state");

      return false;
    },
    data: (user) {
      ref.read(formUserSignInProvider).isLoading = false;
      final context = ref.read(navigtorkeyProvider).currentContext;
      if (user != null) {
        debugPrint("logado");


        
        Navigator.pushReplacementNamed(context!, IndexHomeUser.route);
        
        return true;
      }
      debugPrint("não logado");
      Navigator.pushReplacementNamed(context!, AppRoute.LANDING);

      return false;
    },
    error: (error, stackTrace) {
      ref.read(formUserSignInProvider).isLoading = false;
      debugPrint("erro no login");

      return false;
    },
  );
});

