import 'dart:io';

import 'package:dio/dio.dart';
import 'package:maksimal_test/features/user_detail/data/data_sources/user_detail_api_service.dart';
import 'package:maksimal_test/features/user_detail/data/models/repo.dart';
import 'package:maksimal_test/features/user_detail/domain/repository/user_detail_repository.dart';

import '../../../../core/resources/data_state.dart';


class UserDetailRepositoryImpl implements UserRepository {
  final UserDetailApiService _userDetailApiService;
  UserDetailRepositoryImpl(this._userDetailApiService,);


  @override
  Future<DataState<List<Repo>>> getUserDetail(login) async {
    try {
      final httpResponse = await _userDetailApiService.getUserDetail(login);
      print(httpResponse.response.realUri.toString());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
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
