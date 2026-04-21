/*import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_footer.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_title_section.dart';
import 'package:e_wallet/features/auth/presentation/widgets/login_form.dart';

import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: const AppAppBar(title: "Login"),

      body: SafeArea(
        child: LayoutBuilder(

          builder: (context, constraints) {

            return SingleChildScrollView(

              padding: EdgeInsets.symmetric(horizontal: 24.w),

              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),

                child: IntrinsicHeight(

                  child: Column(
                    children: [

                      AppSpacing.h32,

                      /// HEADER
                      const AuthTitleSection(
                        icon: Icons.account_balance_wallet,
                        title: "Welcome back",
                        description: "Log in to your EZmoney account",
                      ),

                      AppSpacing.h32,

                      /// FORM
                      LoginForm(
                        emailController: emailController,
                        passwordController: passwordController,
                        formKey: formKey,
                      ),

                      /// FORGOT PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            context.push(RoutePaths.forgotPassword);
                          },
                          child: Text(
                            "Forgot Password?",
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      /// LOGIN BUTTON
                      PrimaryButton(
                        text: "Login",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.push(RoutePaths.home);
                          }
                        },
                      ),

                      AppSpacing.h24,

                      /// FOOTER
                      AuthFooter(
                        text: "New to EZmoney?",
                        actionText: "Create Account",
                        onPressed: () {
                          context.push(RoutePaths.register);
                        },
                      ),

                      AppSpacing.h32,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}*/
import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_footer.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_title_section.dart';
import 'package:e_wallet/features/auth/presentation/widgets/login_form.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';

import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.go(RoutePaths.home);
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const AppAppBar(title: "Login"),

        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),

                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),

                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        AppSpacing.h32,

                        /// HEADER
                        const AuthTitleSection(
                          icon: Icons.account_balance_wallet,
                          title: "Welcome back",
                          description: "Log in to your EZmoney account",
                        ),

                        AppSpacing.h32,

                        /// FORM
                        LoginForm(
                          emailController: emailController,
                          passwordController: passwordController,
                          formKey: formKey,
                        ),

                        /// FORGOT PASSWORD
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              context.push(RoutePaths.forgotPassword);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),

                        const Spacer(),

                        /// LOGIN BUTTON
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;

                            return PrimaryButton(
                              text: isLoading ? "Loading..." : "Login",
                              onPressed: isLoading
                                  ? () {}
                                  : () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<AuthCubit>().login(
                                          identifier: emailController.text
                                              .trim(),
                                          password: passwordController.text
                                              .trim(),
                                        );
                                      }
                                    },
                            );
                          },
                        ),

                        AppSpacing.h24,

                        /// FOOTER
                        AuthFooter(
                          text: "New to EZmoney?",
                          actionText: "Create Account",
                          onPressed: () {
                            context.push(RoutePaths.register);
                          },
                        ),

                        AppSpacing.h32,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
