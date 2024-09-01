import 'package:flutter_clean_todo/core/error/failures.dart';
import 'package:flutter_clean_todo/features/home/data/models/weather_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepository {
  Future<Either<BaseFailure, WeatherModel>> weatherDataGet({
    required String cityName,
  });
}
