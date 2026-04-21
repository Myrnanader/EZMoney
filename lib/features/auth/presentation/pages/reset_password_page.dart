/*import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_title_section.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_wallet/features/auth/presentation/widgets/password_reset_form.dart';

class ResetPasswordPage extends StatelessWidget {

  ResetPasswordPage({super.key});

  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: const AppAppBar(title: "New Password"),

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
                        icon: Icons.restart_alt,
                        title: "Create New Password",
                        description:
                        "Your new password must be different from previous passwords.",
                      ),

                      AppSpacing.h32,

                      /// FORM
                      PasswordResetForm(
                        passwordController: passwordController,
                        confirmController: confirmController,
                        formKey: formKey,
                      ),

                      const Spacer(),

                      /// BUTTON
                      PrimaryButton(
                        text: "Reset Password",
                        onPressed: () {

                          if (formKey.currentState!.validate()) {

                            context.go(RoutePaths.resetSuccess);

                          }

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
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_title_section.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_wallet/features/auth/presentation/widgets/password_reset_form.dart';

class ResetPasswordPage extends StatelessWidget {
  final String email;
  final String token;

  ResetPasswordPage({super.key, required this.email, required this.token});

  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          context.go(RoutePaths.resetSuccess);
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const AppAppBar(title: "New Password"),

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
                          icon: Icons.restart_alt,
                          title: "Create New Password",
                          description:
                              "Your new password must be different from previous passwords.",
                        ),

                        AppSpacing.h32,

                        /// FORM
                        PasswordResetForm(
                          passwordController: passwordController,
                          confirmController: confirmController,
                          formKey: formKey,
                        ),

                        const Spacer(),

                        /// BUTTON
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;

                            return PrimaryButton(
                              text: isLoading
                                  ? "Resetting..."
                                  : "Reset Password",
                              onPressed: isLoading
                                  ? () {}
                                  : () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<AuthCubit>().resetPassword(
                                          email: email,
                                          token: token,
                                          password: passwordController.text
                                              .trim(),
                                          confirmPassword: confirmController
                                              .text
                                              .trim(),
                                        );
                                      }
                                    },
                            );
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
