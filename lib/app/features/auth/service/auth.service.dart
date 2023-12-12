import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/providers/navigatorkey.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';

import 'package:olimtec_tcc/app/features/auth/models/user.model.dart';
import 'package:olimtec_tcc/app/features/auth/repository/auth.repository.dart';
import 'package:olimtec_tcc/app/features/splashscreen/splash_screen.dart';
import 'package:olimtec_tcc/app/ui/admin/main_admin.dart';
import 'package:olimtec_tcc/app/ui/user/index_home_user.dart';



final authRepositoryProvider = ChangeNotifierProvider<AuthRepository>((ref) {
  return AuthRepository(auth:FirebaseAuth.instance, ref: ref);
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChange;
});

final isLoggedProvider = StateProvider<bool>((ref) {
  return ref.watch(authStateProvider).when(
    loading: () {

      debugPrint("carregando login state");

      return false;
    },
    data: (user)  {

      
      if (user != null) {
        debugPrint("logado");
        return true;
      }
      debugPrint("não logado");
      final context = ref.read(navigtorkeyProvider).currentContext;
      
      Navigator.pushReplacementNamed(context!, SplashScreen.route);
      return false;
    },
    error: (error, stackTrace) {
          

      debugPrint("erro no login");

      return false;
    },
  );
});

final appUserProvider = StateProvider<AppUser?>((ref) {
  ref.watch(appUserStream).when(data: (appuser){
    
      final context = ref.read(navigtorkeyProvider).currentContext;

 if(appuser.isAdmin == true){

Navigator.pushReplacementNamed(context!, MainAdmin2.route);
CustomSnackBar(message: "Admin", ref: ref);

}else if(appuser.isAdmin == false){

  Navigator.pushReplacementNamed(context!, IndexHomeUser.route);
  CustomSnackBar(message: "Comum", ref: ref);
}
    return appuser;
  },
   error: (e, s){
    
CustomSnackBar(message: "Um erro aconteceu. Tente novamente. cod: appuser not loaded", ref: ref);
  }, 
  loading: (){},
  );
  return null;
});

final appUserStream = StreamProvider((ref) {
return ref.watch(authRepositoryProvider).streamUserdata();

});