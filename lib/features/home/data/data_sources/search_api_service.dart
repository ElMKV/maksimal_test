import 'package:dio/dio.dart';
import 'package:maksimal_test/core/constants/constant.dart';
import 'package:maksimal_test/features/authorization/data/models/auth.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: AppConstants.base)
abstract class SearchApiService {
  factory SearchApiService(Dio dio) = _SearchApiService;

  @GET('/search/users')
  Future<HttpResponse<Users>> searchUser(@Query('q') String query);

  @GET('/users/{login}/followers')
  Future<HttpResponse<List<Items>>> getFollowersUser(@Path() String login);
}
