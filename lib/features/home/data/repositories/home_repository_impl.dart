import 'package:dio/dio.dart';
import 'package:flutter_clean_todo/core/error/failures.dart';
import 'package:flutter_clean_todo/features/home/data/models/weather_model.dart';
import 'package:flutter_clean_todo/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../core/network/connection_checker.dart';
import '../data_sources/remote/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final ConnectionChecker connectionChecker;
  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<BaseFailure, WeatherModel>> weatherDataGet({required String cityName}) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return Left(NetworkConnectionFailure(networkFailureMessage: "No internet connection"));
      }
      final userEntity = await homeRemoteDataSource.weatherDataGet(cityName: cityName);

      return Right(userEntity);
    } on DioException catch (dioError) {
      return Left(ApiFailure(error: dioError, failureMessage: dioError.message));
    } catch (e) {
      return Left(GeneralExceptionFailure(error: e));
    }
  }
}
