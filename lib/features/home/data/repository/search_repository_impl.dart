import 'dart:io';
import 'package:dio/dio.dart';
import 'package:maksimal_test/features/home/data/data_sources/search_api_service.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';
import 'package:maksimal_test/features/home/domain/repository/search_repository.dart';

import '../../../../core/resources/data_state.dart';


class SearchRepositoryImpl implements SearchRepository {
  final SearchApiService _searchApiService;
  SearchRepositoryImpl(this._searchApiService,);
  @override
  Future<DataState<Users>> searchUser(body) async {
    try {
      final httpResponse = await _searchApiService.searchUser(body);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data.totalCount);
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

  @override
  Future<DataState<List<Items>>> getFollowersUser(login) async {
    try {
      final httpResponse = await _searchApiService.getFollowersUser(login);
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
