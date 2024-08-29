import 'package:flutter_clean_todo/core/constants/app_images.dart';
import 'package:flutter_clean_todo/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_todo/dependency_injection.dart';
import 'package:flutter_clean_todo/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_clean_todo/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final homeController = getIt<HomeController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {},
      );

      // bool isAutologin = await authController.checkAutoLogin();
      // if (isAutologin) {
      //   Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      // } else {
      //   Get.offAllNamed(Routes.LOGIN);
      // }
      //TODO:- Navigation after splash
      context.goNamed(Routes.home.name);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          backgroundColor: AppColors.primaryColor,
    );
  }
}
