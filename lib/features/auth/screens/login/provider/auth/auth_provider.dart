import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/core/config/constants/paths.dart';
import 'package:test_app/features/auth/data/auth_repository.dart';
import 'package:test_app/features/auth/screens/login/provider/auth/auth_notifier.dart';
import 'package:test_app/features/auth/screens/login/provider/auth/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    return AuthNotifier(
      authRepository: AuthRepository(
        dio: Dio(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        ),
      ),
    );
  },
);
