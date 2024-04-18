import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maksimal_test/features/authorization/data/data_sources/auth_api_service.dart';
import 'package:maksimal_test/features/authorization/data/repository/auth_repository_impl.dart';
import 'package:maksimal_test/features/authorization/domain/repository/auth_repository.dart';
import 'package:maksimal_test/features/authorization/domain/usecases/get_auth.dart';

import 'features/authorization/presentation/bloc/auth/remote/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Data sources
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAuthUseCase(sl()));

  // Blocs
  sl.registerFactory(() => AuthBloc(sl()));
}