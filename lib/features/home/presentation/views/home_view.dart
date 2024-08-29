import 'package:flutter_clean_todo/core/common/widgets/custom_text_form_field.dart';
import 'package:flutter_clean_todo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_todo/dependency_injection.dart';
import 'package:flutter_clean_todo/features/home/presentation/controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = getIt<HomeController>();

  TextEditingController cityName = TextEditingController(text: "surat");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.weatherGetDataApi(cityName: cityName.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.surfaceBackground,
      appBar: AppBar(
        title: const Text(
          "HomeView",
          maxLines: 1,
        ),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextFormField(
                  controller: cityName,
                filled: false,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: "Inter",
                  overflow: TextOverflow.ellipsis,
                ),
                cursorColor: AppColors.primaryColor,
                textInputAction: TextInputAction.done,
                maxLines: 1,
                onChanged: (p0)  {
                  homeController.weatherGetDataApi(cityName: cityName.text.trim());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
