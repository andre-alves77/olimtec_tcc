import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/auth/providers/state/auth_state.dart';
import 'package:olimtec_tcc/app/auth/remote_data_source/auth.repository.dart';
import 'package:olimtec_tcc/app/core/providers/firebase.provider.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource(ref.read(firebaseAuthProvider), ref);
});

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthenticationState>(
  (ref) => AuthNotifier(ref.read(authDataSourceProvider)),
);

class AuthNotifier extends StateNotifier<AuthenticationState> {
  AuthNotifier(this._dataSource) : super(const AuthenticationState.initial());

  final AuthDataSource _dataSource;

  Future<void> login({required String email, required String password}) async {
    state = const AuthenticationState.loading();
    final response = await _dataSource.login(email: email, password: password);
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.authenticated(user: response),
    );
  }

  Future<void> signup({required String email, required String password}) async {
    state = const AuthenticationState.loading();
    final response = await _dataSource.signup(email: email, password: password);
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.authenticated(user: response),
    );
  }

  signout() {
    _dataSource.signout();
    state = const AuthenticationState.initial();
  }
}
