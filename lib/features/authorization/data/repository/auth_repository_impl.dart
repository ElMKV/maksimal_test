import 'dart:io';

import 'package:dio/dio.dart';
import 'package:maksimal_test/features/authorization/data/data_sources/auth_api_service.dart';
import 'package:maksimal_test/features/authorization/data/models/auth.dart';
import 'package:maksimal_test/features/authorization/domain/repository/auth_repository.dart';

import '../../../../core/resources/data_state.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;
  AuthRepositoryImpl(this._authApiService,);
  @override
  Future<DataState<Auth>> getAuth(body) async {
    try {
      final httpResponse = await _authApiService.getAuth(body);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data.token);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }
}
