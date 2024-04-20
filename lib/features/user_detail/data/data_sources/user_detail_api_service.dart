import 'package:dio/dio.dart';
import 'package:maksimal_test/core/constants/constant.dart';
import 'package:maksimal_test/features/authorization/data/models/auth.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';
import 'package:maksimal_test/features/user_detail/data/models/repo.dart';
import 'package:retrofit/retrofit.dart';

part 'user_detail_api_service.g.dart';

@RestApi(baseUrl: AppConstants.base)
abstract class UserDetailApiService {
  factory UserDetailApiService(Dio dio) = _UserDetailApiService;

  @GET('/users/{login}/repos')
  Future<HttpResponse<List<Repo>>> getUserDetail(@Path() String login);
}
