/*import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_title_section.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_footer.dart';
import 'package:e_wallet/features/auth/presentation/widgets/forgot_password_form.dart';



class ForgotPasswordPage extends StatelessWidget {

  ForgotPasswordPage({super.key});

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: const AppAppBar(title: "Recovery"),

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
                        title: "Forgot Password?",
                        description:
                        "Enter your email or phone number\nand we'll send a code to reset\nyour password.",
                      ),

                      AppSpacing.h32,

                      /// FORM
                      ForgotPasswordForm(
                        controller: emailController,
                        formKey: formKey,
                      ),

                      const Spacer(),

                      /// BUTTON
                      PrimaryButton(
                        text: "Send Reset Code",
                        onPressed: () {

                          if (formKey.currentState!.validate()) {

                            context.push(RoutePaths.otp);

                          }

                        },
                      ),

                      AppSpacing.h24,

                      /// FOOTER
                      AuthFooter(
                        text: "",
                        actionText: "Back to Login",
                        onPressed: () {
                          context.pop();
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
import 'package:e_wallet/features/auth/presentation/widgets/auth_footer.dart';
import 'package:e_wallet/features/auth/presentation/widgets/forgot_password_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthOtpSent) {
          context.push(
            RoutePaths.otp,
            extra: {
              "email": emailController.text.trim(),
              "type": "reset",
            },
          );
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const AppAppBar(title: "Recovery"),

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
                          title: "Forgot Password?",
                          description:
                              "Enter your email or phone number\nand we'll send a code to reset\nyour password.",
                        ),

                        AppSpacing.h32,

                        /// FORM
                        ForgotPasswordForm(
                          controller: emailController,
                          formKey: formKey,
                        ),

                        const Spacer(),

                        /// BUTTON
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;

                            return PrimaryButton(
                              text: isLoading
                                  ? "Sending..."
                                  : "Send Reset Code",
                              onPressed: isLoading
                                  ? () {}
                                  : () {
                                      if (formKey.currentState!.validate()) {
                                        context
                                            .read<AuthCubit>()
                                            .forgotPassword(
                                              emailController.text.trim(),
                                            );
                                      }
                                    },
                            );
                          },
                        ),

                        AppSpacing.h24,

                        /// FOOTER
                        AuthFooter(
                          text: "",
                          actionText: "Back to Login",
                          onPressed: () {
                            context.pop();
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