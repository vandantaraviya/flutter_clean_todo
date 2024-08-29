import 'package:flutter_clean_todo/core/constants/constant.dart';
import 'package:flutter_clean_todo/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvConfig devConfig = EnvConfig(
    appName: Constant.appNameDev.tr,
    baseUrl: Constant.baseUrlDev,
  );

  BuildConfig.instantiate(
    envType: Environment.dev,
    envConfig: devConfig,
  );

  await initDependencyInjections();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(const MyApp()));
}
