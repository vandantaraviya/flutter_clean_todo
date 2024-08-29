import 'package:flutter_clean_todo/core/error/failures.dart';
import 'package:flutter_clean_todo/core/usecase/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_todo/features/home/data/models/weather_model.dart';
import 'package:flutter_clean_todo/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class WeatherDataGetUseCase implements UseCase<WeatherModel, WeatherDataParams> {
  final HomeRepository homeRepository;
  WeatherDataGetUseCase({required this.homeRepository});

  @override
  Future<Either<BaseFailure, WeatherModel>> call({required WeatherDataParams params}) async {
    return await homeRepository.weatherDataGet(cityName: params.cityName,queryParameters: params.queryParameters);
  }
}

class WeatherDataParams extends Equatable {
  final String cityName;
  final Map<String, dynamic> queryParameters;
  const WeatherDataParams({
    required this.cityName,
    required this.queryParameters,
  });

  @override
  List<Object?> get props => [cityName, queryParameters];
}
