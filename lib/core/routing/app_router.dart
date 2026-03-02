import 'package:e_wallet/core/routing/go_router_refresh_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/app/presentation/cubit/app_cubit.dart';
import '../../features/app/presentation/cubit/app_state.dart';

import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';

import 'route_paths.dart';
import 'route_names.dart';

class AppRouter {
  static GoRouter createRouter(BuildContext context) {
    final appCubit = context.read<AppCubit>();

    return GoRouter(
      initialLocation: RoutePaths.splash,

      refreshListenable: GoRouterRefreshStream(appCubit.stream),

      redirect: (context, state) {
        final status = appCubit.state.status;
        final location = state.matchedLocation;

        if (status == AppStatus.initial) {
          return RoutePaths.splash;
        }

        if (status == AppStatus.authenticated &&
            location != RoutePaths.home) {
          return RoutePaths.home;
        }

        if (status == AppStatus.unauthenticated &&
            location != RoutePaths.onboarding) {
          return RoutePaths.onboarding;
        }

        return null;
      },

      routes: [
        GoRoute(
          path: RoutePaths.splash,
          name: RouteNames.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: RoutePaths.onboarding,
          name: RouteNames.onboarding,
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: RoutePaths.home,
          name: RouteNames.home,
          builder: (context, state) =>
              const Scaffold(body: Center(child: Text("Home"))),
        ),
      ],
    );
  }
}