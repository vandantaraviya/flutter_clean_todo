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
  EnvConfig prodConfig = EnvConfig(
    appName: Constant.appName.tr,
    baseUrl: Constant.baseUrlProd,
  );

  BuildConfig.instantiate(
    envType: Environment.prod,
    envConfig: prodConfig,
  );

  await initDependencyInjections();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(const MyApp()));
}
