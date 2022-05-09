import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../core/either.dart';
import '../../core/error/failure.dart';
import '../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class LoginUser extends UseCase<String, Unit, LoginParams> {
  final AuthRepository authRepository;

  LoginUser(this.authRepository);

  @override
  FutureOr<Either<Failure<String>, Unit>> call(LoginParams params) {
    return authRepository.login(
      params.email,
      params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
