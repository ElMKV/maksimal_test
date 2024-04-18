import 'package:dio/dio.dart';
import 'package:maksimal_test/core/constants/constant.dart';
import 'package:maksimal_test/features/authorization/data/models/auth.dart';
import 'package:retrofit/retrofit.dart';



part 'auth_api_service.g.dart';

@RestApi(baseUrl: AppConstants.base)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/cards-hive-back/api/login')
  Future<HttpResponse<Auth>> getAuth(@Body() Map<String, dynamic> body);
}
