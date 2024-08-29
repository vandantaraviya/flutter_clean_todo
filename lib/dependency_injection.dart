import 'package:flutter_clean_todo/core/services/api_services/api_services.dart';
import 'package:flutter_clean_todo/core/services/api_services/custom_interceptor.dart';
import 'package:flutter_clean_todo/core/services/storage_services/storage_services.dart';
import 'package:flutter_clean_todo/core/services/translation/translation_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_todo/core/network/connection_checker.dart';
import 'package:flutter_clean_todo/features/home/data/repositories/home_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'flavors/build_config.dart';

final getIt = GetIt.instance;

Future<void> initDependencyInjections() async {
  ///3rd party
  _thirdPartyDependencyInjection();

  ///  Services
  await _servicesDependencyInjection();

  ///Core

  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  //
  getIt.registerLazySingleton<ConnectionChecker>(() => ConnectionCheckerImpl(connectivity: getIt<Connectivity>()));

  ///------[Features]--------
  ///Auth Dependency Injection

  _authDependencyInjection();

  ///Bottom nav bar Dependency Injection
  _bottomNavBarDependencyInjection();
}

//
//
//

///3rd party
_thirdPartyDependencyInjection() {
  // Register the Dio class with GetIt

  Dio dio = Dio(
    BaseOptions(
      baseUrl: BuildConfig.instance.config.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),

      // headers: headers,
    ),
  )..interceptors.addAll([
      CustomInterceptor(),
      LogInterceptor(
        responseBody: false,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: false,
      )
    ]);
  getIt.registerLazySingleton<Dio>(() => dio);
}

//
//
//

///  Services

Future<void> _servicesDependencyInjection() async {
  getIt.registerSingletonAsync<StorageService>(() async {
    return await StorageService.init();
  });

  // getIt.registerSingleton(() => StorageService());

  getIt.registerLazySingleton(() => ApiServices(
        dio: getIt<Dio>(),
        storageService: getIt<StorageService>(),
      ));

  getIt.registerLazySingleton(() => TranslationService(
        storageService: getIt<StorageService>(),
      ));
}

//
//
//

///Auth Dependency Injection
_authDependencyInjection() {
  ///Data-Sources

  getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(apiServices: getIt<ApiServices>()));
  // getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());

  ///Repositories
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
        connectionChecker: getIt<ConnectionChecker>(),
      ));

  ///UseCases

  // getIt.registerLazySingleton(() => WeatherDataGetUseCase(
  //       homeRepository: getIt<AuthRepository>(),
  //     ));
  //
  // ///Controller
  // getIt.registerLazySingleton(() => AuthController(
  //       // apiService: getIt<ApiServices>(),
  //       storageService: getIt<StorageService>(),
  //       loginWithEmailPasswordUseCase: getIt<LoginWithEmailPasswordUseCase>(),
  //     ));
}

///Bottom nav bar Dependency Injection
_bottomNavBarDependencyInjection() {

}
