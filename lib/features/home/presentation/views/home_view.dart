import 'package:flutter_clean_todo/core/common/widgets/custom_text_form_field.dart';
import 'package:flutter_clean_todo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cityName = TextEditingController();

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
