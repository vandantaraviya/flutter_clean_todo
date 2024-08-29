import 'package:flutter_clean_todo/core/common/text_styles/text_styles.dart';
import 'package:flutter_clean_todo/core/routes/routes.dart';
import 'package:flutter_clean_todo/core/services/translation/app_translation.dart';
import 'package:flutter_clean_todo/core/services/translation/translation_service.dart';
import 'package:flutter_clean_todo/core/theme/app_colors.dart';
import 'package:flutter_clean_todo/dependency_injection.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;
  final translationService = getIt<TranslationService>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: _envConfig.appName,
      routerDelegate: goRoutePage.routerDelegate,
      backButtonDispatcher: goRoutePage.backButtonDispatcher,
      routeInformationParser: goRoutePage.routeInformationParser,
      routeInformationProvider: goRoutePage.routeInformationProvider,
      translations: AppTranslation(),

      locale: Locale(translationService.langCode.value),
      fallbackLocale: const Locale('en_US'),
      // builder: EasyLoading.init(),
      theme: ThemeData(
        // brightness: Brightness.dark,
        // scaffoldBackgroundColor: AppColors.surfaceBackground,
        primaryColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: appBarTitleTextStyle,
        ),
        textTheme:  TextTheme(
          labelLarge: TextStyle(
            color: AppColors.textGreyColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Poppins',
      ),
    );
  }
}
