import 'package:flutter_clean_todo/core/services/api_services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_todo/core/constants/api_endpoints.dart';
import 'package:flutter_clean_todo/core/error/failures.dart';
import 'package:flutter_clean_todo/features/home/data/models/weather_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<WeatherModel> weatherDataGet({
    required String cityName,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<WeatherModel> weatherDataGet({
    required String cityName,
  }) async {
    try {
      final response = await apiServices.getWithoutToken(
        endPoint: ApiEndpoints.login,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> body = response.data;
          WeatherModel weatherModel = WeatherModel.fromMap(body);
          return weatherModel;
        }
      }

      throw ApiFailure(failureMessage: "Response is NUll");
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
