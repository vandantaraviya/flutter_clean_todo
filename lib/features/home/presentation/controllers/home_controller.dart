import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_clean_todo/core/common/widgets/custom_snackbar.dart';
import 'package:flutter_clean_todo/core/constants/constant.dart';
import 'package:flutter_clean_todo/features/home/data/models/weather_model.dart';
import 'package:flutter_clean_todo/features/home/domain/usecases/weather_data_get.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final WeatherDataGetUseCase weatherDataGetUseCase;

  HomeController({required this.weatherDataGetUseCase});

  final Rx<WeatherModel> _weatherGetData = WeatherModel().obs;

  Rx<WeatherModel> get weatherGetData => _weatherGetData;


  Future<void> weatherGetDataApi({
    required String cityName,
  }) async {
    // loading(show: true, title: "Authenticating...");
    try {
      var queryData = {
        "q": cityName,
        "appid": Constant.appIdDev,
      };
      var response = await weatherDataGetUseCase.call(
          params: WeatherDataParams(cityName: cityName,queryParameters: queryData),
      );
      response.fold((baseFailure) {
        log(baseFailure.toString());
      }, (WeatherModel weatherModel) {
        log(weatherModel.toString(), name: "userEntity");
      });
    } on DioException catch (ex) {
      if (ex.response != null) {
        final data = ex.response!.data;

        CustomSnackBar.errorSnackBar(message: data['message'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } catch (e) {
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      log(e.toString());
    } finally {
      // loading(show: false);
    }
  }
}
