import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/features/auth/data/auth_repository.dart';
import 'package:test_app/features/auth/screens/login/provider/auth/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({
    required this.authRepository,
  }) : super(AuthState.checking);

  Future<bool> login() async {
    final response =
        await authRepository.login(userName: 'pipe', password: '12345');

    if (response == null) return false;

    state = AuthState.authenticated;

    return true;
  }
}
