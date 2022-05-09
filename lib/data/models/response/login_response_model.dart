import '../../../domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponse {
  const LoginResponseModel({
    required String token,
    required String name,
  }) : super(token: token, name: name);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
      name: json['name'],
    );
  }
}
