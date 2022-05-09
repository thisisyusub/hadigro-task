import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/auth_repository.dart';

enum AuthState { initial, authenticated, unauthenticated }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthState.initial);

  final AuthRepository authRepository;

  void checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    final result = await authRepository.isAuthenticated();

    result.when(
      error: (_) => emit(AuthState.unauthenticated),
      success: (isAuthenticated) {
        final state = isAuthenticated
            ? AuthState.authenticated
            : AuthState.unauthenticated;

        emit(state);
      },
    );
  }
}
