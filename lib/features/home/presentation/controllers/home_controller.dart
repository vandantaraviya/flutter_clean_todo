import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_clean_todo/core/common/widgets/custom_snackbar.dart';
import 'package:flutter_clean_todo/core/constants/constant.dart';
import 'package:flutter_clean_todo/features/home/data/models/weather_model.dart';
import 'package:flutter_clean_todo/features/home/domain/weather_cases/weather_data_get.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final WeatherDataGetUseCase weatherDataGetUseCase;

  HomeController({required this.weatherDataGetUseCase});

  final RxList<WeatherModel> _weatherGetData = <WeatherModel>[].obs;
  RxList<WeatherModel> get weatherGetData => _weatherGetData;

  final RxBool _weatherDataLoading = false.obs;
  RxBool get weatherDataLoading => _weatherDataLoading;


  Future<void> weatherGetDataApi({
    required String cityName,
  }) async {
    try {
      weatherGetData.clear();
      _weatherDataLoading.value = true;
      var response = await weatherDataGetUseCase.call(
          params: WeatherDataParams(cityName: cityName),
      );
      response.fold((baseFailure) {
        log(baseFailure.toString());
        _weatherDataLoading.value = false;
      }, (WeatherModel weatherModel) {
        _weatherGetData.add(weatherModel);
        _weatherDataLoading.value = false;
      });
    } on DioException catch (ex) {
      _weatherDataLoading.value = false;
      if (ex.response != null) {
        final data = ex.response!.data;

        CustomSnackBar.errorSnackBar(message: data['message'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } catch (e) {
      _weatherDataLoading.value = false;
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      log(e.toString());
    } finally {
      _weatherDataLoading.value = false;
      // loading(show: false);
    }
  }
}
