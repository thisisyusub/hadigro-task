import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/data_state.dart';
import '../../../core/either.dart';
import '../../../domain/use_cases/login.dart';

typedef LoginState = DataState<Unit, String?>;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUser) : super(const DataState());

  final LoginUser loginUser;

  void login(String email, String password) async {
    emit(state.copyWith(isInProgress: true));

    final result = await loginUser(LoginParams(
      email: email,
      password: password,
    ));

    result.when(
      error: (result) {
        emit(state.copyWith(isFailure: true, error: result.error));
      },
      success: (data) {
        emit(state.copyWith(isSuccess: true, data: unit));
      },
    );
  }
}
