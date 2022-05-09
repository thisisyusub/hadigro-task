import 'package:dio/dio.dart';

import '../../../core/constants/endpoints.dart';
import '../../models/request/login_request_model.dart';
import '../../models/response/generic_response_model.dart';
import '../../models/response/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<GenericResponseModel<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel,
  );
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<GenericResponseModel<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    final response = await dio.post(
      Endpoints.login,
      data: loginRequestModel.toJson(),
      options: Options(
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      ),
    );

    return GenericResponseModel.fromJson(
      response.data,
      dataFromJson: LoginResponseModel.fromJson,
    );
  }
}
