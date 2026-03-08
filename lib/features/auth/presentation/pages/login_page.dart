import 'package:e_wallet/core/routing/route_paths.dart';
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
/*
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

                  child: Form(
                    key: formKey,

                    child: Column(
                      children: [

                        AppSpacing.h32,

                        /// HEADER
                        AuthTitleSection(
                          icon: Icons.account_balance_wallet,
                          title: "Welcome back",
                          description: "Log in to your EZmoney account",
                        ),

                        AppSpacing.h32,

                        /// EMAIL FIELD
                        AuthTextField(
                          label: "Email or phone",
                          hint: "your@email.com",
                          controller: emailController,
                          validator: AuthValidator.emailOrPhone,
                        ),

                        AppSpacing.h16,

                        /// PASSWORD
                        PasswordField(
                          controller: passwordController,
                          validator: AuthValidator.password,
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

                            }

                          },
                        ),

                        AppSpacing.h24,

                        /// CREATE ACCOUNT
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [

                            Text(
                              "New to EZmoney?",
                              style: AppTextStyles.body,
                            ),

                            TextButton(
                              onPressed: () {
                                context.push(RoutePaths.register);
                              },
                              child: Text(
                                "Create Account",
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),

                          ],
                        ),

                        AppSpacing.h32,

                      ],
                    ),
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
                          if (formKey.currentState!.validate()) {}
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
}