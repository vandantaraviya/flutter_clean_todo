import 'package:flutter_clean_todo/core/common/text_styles/text_styles.dart';
import 'package:flutter_clean_todo/core/common/widgets/custom_text_form_field.dart';
import 'package:flutter_clean_todo/core/constants/api_endpoints.dart';
import 'package:flutter_clean_todo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_todo/dependency_injection.dart';
import 'package:flutter_clean_todo/features/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = getIt<HomeController>();
  Debouncer deBouncer = Debouncer(
    delay: const Duration(
      milliseconds: 900,
    ),
  );

  TextEditingController cityName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: AppBar(
        title: const Text(
          "HomeView",
          maxLines: 1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: cityName,
                  filled: false,
                  textStyle: textFieldStylePoppins,
                  cursorColor: AppColors.primaryColor,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  onChanged: (value) {
                    deBouncer.call(
                      () {
                        homeController.weatherGetDataApi(cityName: value);
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Obx(
                  () {
                    return homeController.weatherDataLoading.value == true
                        ? const CircularProgressIndicator(
                            strokeWidth: 1,
                            strokeCap: StrokeCap.round,
                            color: AppColors.primaryColor,
                          )
                        : homeController.weatherGetData.isEmpty
                            ? const Text("No Data Found")
                            : Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          ApiEndpoints.weatherIcon(
                                            homeController.weatherGetData.first.weather!.first.icon.toString(),
                                          ),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text("weather :- ${homeController.weatherGetData.first.weather!.first.main}",style: poppinsTextStyle,),
                                  const SizedBox(height: 10,),
                                  Text("City Name :- ${homeController.weatherGetData.first.name}",style: poppinsTextStyle,),
                                  const SizedBox(height: 10,),
                                  Text("temperature :- ${homeController.weatherGetData.first.main!.temp}",style: poppinsTextStyle,),
                                  const SizedBox(height: 10,),
                                ],
                              );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
