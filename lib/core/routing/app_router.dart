/*import 'package:e_wallet/core/routing/route_names.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/pages/password_reset_success_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/register_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/set_pin_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/verify_identity_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/wallet_ready_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/add_card_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/card_success_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/empty_wallet_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/main_navigation_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/verify_card_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/onboarding/presentation/pages/welcome_page.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/otp_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';

import 'route_paths.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutePaths.splash,

    routes: [
      /// Splash
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => const SplashPage(),
      ),

      /// Welcome
      GoRoute(
        path: RoutePaths.welcome,
        builder: (context, state) => const WelcomePage(),
      ),

      /// Onboarding
      GoRoute(
        path: RoutePaths.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),

      /// Login
      GoRoute(path: RoutePaths.login, builder: (context, state) => LoginPage()),

      /// Forgot Password
      GoRoute(
        path: RoutePaths.forgotPassword,
        builder: (context, state) => ForgotPasswordPage(),
      ),

      /// OTP Verification
      GoRoute(
        path: RoutePaths.otp,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;

          return BlocProvider.value(
            value: context.read<AuthCubit>(),
            child: OtpPage(email: data["email"], type: data["type"]),
          );
        },
      ),

      /// Reset Password
      GoRoute(
        path: RoutePaths.resetPassword,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;

          return BlocProvider.value(
            value: context.read<AuthCubit>(),
            child: ResetPasswordPage(
              email: data["email"],
              token: data["token"],
            ),
          );
        },
      ),

      /// Password Reset Success
      GoRoute(
        path: RoutePaths.resetSuccess,
        builder: (context, state) => const PasswordResetSuccessPage(),
      ),

      /// Register
      GoRoute(
        path: RoutePaths.register,
        builder: (context, state) => RegisterPage(),
      ),

      /// Verify Identity
      GoRoute(
        path: RoutePaths.verifyIdentity,
        builder: (context, state) => const VerifyIdentityPage(),
      ),

      /// Set PIN
      GoRoute(
        path: RoutePaths.setPin,
        builder: (context, state) => const SetPinPage(),
      ),

      /// Wallet Ready
      GoRoute(
        path: RoutePaths.walletReady,
        builder: (context, state) => const WalletReadyPage(),
      ),
      GoRoute(
        path: RoutePaths.home,
        builder: (context, state) => const MainNavigationPage(),
      ),

      GoRoute(
        path: RoutePaths.emptyWallet,
        name: RouteNames.emptyWallet,
        builder: (context, state) => const EmptyWalletPage(),
      ),

      GoRoute(
        path: RoutePaths.addCard,
        name: RouteNames.addCard,
        builder: (context, state) => const AddCardPage(),
      ),

      GoRoute(
        path: RoutePaths.verifyCard,
        name: RouteNames.verifyCard,
        builder: (context, state) => const VerifyCardPage(),
      ),

      GoRoute(
        path: RoutePaths.cardSuccess,
        name: RouteNames.cardSuccess,
        builder: (context, state) => const CardSuccessPage(),
      ),
    ],
  );
}
*/

import 'package:e_wallet/core/di/di.dart';
import 'package:e_wallet/core/routing/route_names.dart';
import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/features/app/presentation/cubit/app_cubit.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/login_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/otp_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/register_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/reset_password_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/set_pin_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/password_reset_success_page.dart';
import 'package:e_wallet/features/auth/presentation/pages/wallet_ready_page.dart';
import 'package:e_wallet/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:e_wallet/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:e_wallet/features/splash/presentation/pages/splash_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/add_card_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/card_success_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/empty_wallet_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/main_navigation_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/verify_card_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'go_router_refresh_stream.dart';

class AppRouter {
  static GoRouter createRouter(AppCubit appCubit) {
    return GoRouter(
      initialLocation: RoutePaths.splash,

      /// 🔥 يخلي router reactive
      refreshListenable: GoRouterRefreshStream(appCubit.stream),

      /// 🔐 AUTH GUARD
      redirect: (context, state) {
        final isLoggedIn = appCubit.state is AppAuthenticated;

        final isPublicRoute = [
          RoutePaths.splash,
          RoutePaths.onboarding,
          RoutePaths.welcome,
          RoutePaths.login,
          RoutePaths.register,
          RoutePaths.forgotPassword,
          RoutePaths.otp,
          RoutePaths.resetPassword,
        ];

        /// ❌ مش لوجين
        if (!isLoggedIn &&
            !isPublicRoute.contains(state.matchedLocation)) {
          return RoutePaths.login;
        }

        /// ✅ لوجين → امنعه يرجع ل auth
        if (isLoggedIn &&
            isPublicRoute.contains(state.matchedLocation)) {
          return RoutePaths.home;
        }

        return null;
      },

      routes: [
        /// Splash
        GoRoute(
          path: RoutePaths.splash,
          builder: (context, state) => const SplashPage(),
        ),

        /// Welcome
        GoRoute(
          path: RoutePaths.welcome,
          builder: (context, state) => const WelcomePage(),
        ),

        /// Onboarding
        GoRoute(
          path: RoutePaths.onboarding,
          builder: (context, state) => const OnboardingPage(),
        ),

        /// 🔥 Login (instance أساسي)
        GoRoute(
          path: RoutePaths.login,
          builder: (context, state) {
            return BlocProvider(
              create: (_) => sl<AuthCubit>(),
              child: LoginPage(),
            );
          },
        ),

        /// 🔥 Register (نفس instance من login)
        GoRoute(
          path: RoutePaths.register,
          builder: (context, state) {
            return BlocProvider.value(
              value: context.read<AuthCubit>(),
              child: RegisterPage(),
            );
          },
        ),

        /// Forgot Password
        GoRoute(
          path: RoutePaths.forgotPassword,
          builder: (context, state) {
            return BlocProvider.value(
              value: context.read<AuthCubit>(),
              child: ForgotPasswordPage(),
            );
          },
        ),

        /// OTP
        GoRoute(
          path: RoutePaths.otp,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>?;

            if (data == null) return const SplashPage();

            return BlocProvider.value(
              value: context.read<AuthCubit>(),
              child: OtpPage(
                email: data["email"],
                type: data["type"],
              ),
            );
          },
        ),

        /// Reset Password
        GoRoute(
          path: RoutePaths.resetPassword,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>?;

            if (data == null) return const SplashPage();

            return BlocProvider.value(
              value: context.read<AuthCubit>(),
              child: ResetPasswordPage(
                email: data["email"],
                token: data["token"],
              ),
            );
          },
        ),

        /// Reset Success
        GoRoute(
          path: RoutePaths.resetSuccess,
          builder: (context, state) =>
              const PasswordResetSuccessPage(),
        ),

        /// Set PIN
        GoRoute(
          path: RoutePaths.setPin,
          builder: (context, state) {
            return BlocProvider.value(
              value: context.read<AuthCubit>(),
              child: const SetPinPage(),
            );
          },
        ),

        /// Wallet Ready
        GoRoute(
          path: RoutePaths.walletReady,
          builder: (context, state) =>
              const WalletReadyPage(),
        ),

        /// Home
        GoRoute(
          path: RoutePaths.home,
          builder: (context, state) =>
              const MainNavigationPage(),
        ),

        /// Wallet
        GoRoute(
          path: RoutePaths.emptyWallet,
          name: RouteNames.emptyWallet,
          builder: (context, state) =>
              const EmptyWalletPage(),
        ),

        GoRoute(
          path: RoutePaths.addCard,
          name: RouteNames.addCard,
          builder: (context, state) =>
              const AddCardPage(),
        ),

        GoRoute(
          path: RoutePaths.verifyCard,
          name: RouteNames.verifyCard,
          builder: (context, state) =>
              const VerifyCardPage(),
        ),

        GoRoute(
          path: RoutePaths.cardSuccess,
          name: RouteNames.cardSuccess,
          builder: (context, state) =>
              const CardSuccessPage(),
        ),
      ],
    );
  }
}