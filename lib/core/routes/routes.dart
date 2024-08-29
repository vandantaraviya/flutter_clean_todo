import 'package:flutter_clean_todo/features/authentication/presentation/views/splash_view.dart';
import 'package:flutter_clean_todo/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes_name.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// ------------------  List of all GoRouter Routs ------------------

final goRoutePage = GoRouter(
  initialLocation: Routes.initial.path,
  navigatorKey: rootNavigatorKey,
  errorPageBuilder: (context, state) => const NoTransitionPage(child: HomeView()),
  routes: [
    /// Splash Screen
    GoRoute(
      name: Routes.initial.name,
      path: Routes.initial.path,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SplashView());
      },
    ),


    ///------------------ Home screen with bottom-bar ------------------
    GoRoute(
      name: Routes.home.name,
      path: Routes.home.path,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: HomeView());
      },
      routes: const [],
    ),
  ],
);