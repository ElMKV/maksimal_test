import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maksimal_test/features/home/data/data_sources/search_api_service.dart';
import 'package:maksimal_test/features/home/data/repository/search_repository_impl.dart';
import 'package:maksimal_test/features/home/domain/repository/search_repository.dart';
import 'package:maksimal_test/features/home/domain/usecases/followers_user.dart';
import 'package:maksimal_test/features/home/domain/usecases/search_user.dart';
import 'package:maksimal_test/features/home/presentation/bloc/search_bloc.dart';
import 'package:maksimal_test/features/user_detail/data/data_sources/user_detail_api_service.dart';
import 'package:maksimal_test/features/user_detail/data/repository/user_detail_repository_impl.dart';
import 'package:maksimal_test/features/user_detail/domain/repository/user_detail_repository.dart';
import 'package:maksimal_test/features/user_detail/domain/usecases/user_detail.dart';
import 'package:maksimal_test/features/user_detail/presentation/bloc/user_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Data sources
  sl.registerSingleton<SearchApiService>(SearchApiService(sl()));
  sl.registerSingleton<UserDetailApiService>(UserDetailApiService(sl()));

  // Repository
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserDetailRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => SearchUserUseCase(sl()));
  sl.registerLazySingleton(() => FollowersUserUseCase(sl()));
  sl.registerLazySingleton(() => UserUseCase(sl()));

  // Blocs
  sl.registerFactory(() => SearchBloc(sl(), sl()));
  sl.registerFactory(() => UserBloc(sl()));

}