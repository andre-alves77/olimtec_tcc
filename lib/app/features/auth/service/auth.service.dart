import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/providers/firebase.provider.dart';
import 'package:olimtec_tcc/app/core/providers/navigatorkey.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/auth/lading.store.dart';
import 'package:olimtec_tcc/app/features/auth/models/user.model.dart';
import 'package:olimtec_tcc/app/features/auth/repository/auth.repository.dart';
import 'package:olimtec_tcc/app/ui/admin/main_admin.dart';
import 'package:olimtec_tcc/app/ui/user/index_home_user.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

final authRepositoryProvider = ChangeNotifierProvider<AuthRepository>((ref) {
  return AuthRepository(auth:FirebaseAuth.instance, ref: ref);
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChange;
});

final isLoggedProvider = StateProvider<bool>((ref) {
  return ref.watch(authStateProvider).when(
    loading: () {
      ref.read(formUserSignInProvider).isLoading = false;

      debugPrint("carregando login state");

      return false;
    },
    data: (user)  {
      ref.read(formUserSignInProvider).isLoading = false;
      final context = ref.read(navigtorkeyProvider).currentContext;
      if (user != null) {
        debugPrint("logado");
        



     


//if(appuser!.isAdmin == true){
//Navigator.pushReplacementNamed(context!, MainAdmin.route);
//}else{
//Navigator.pushReplacementNamed(context!, IndexHomeUser.route);
//}
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

