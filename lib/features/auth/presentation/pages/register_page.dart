import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/data/models/register_request.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_header.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/app_snackbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_footer.dart';
import 'package:e_wallet/features/auth/presentation/widgets/register_form.dart';
import 'package:e_wallet/features/auth/presentation/widgets/terms_text.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthOtpSent) {
          context.push(
            RoutePaths.otp,
            extra: {
              "email": emailController.text.trim(),
              "type": "register",
            },
          );
        }
        if (state is AuthError) {
          AppSnackBar.show(context, message: state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const AppAppBar(title: "Create Account"),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppSpacing.h32,
                        const AuthHeader(
                          title: "Join EZmoney",
                          subtitle: "Start your premium fintech journey today.",
                        ),
                        AppSpacing.h32,
                        RegisterForm(
                          nameController: nameController,
                          phoneController: phoneController,
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        AppSpacing.h20,
                        const TermsText(),
                        const Spacer(),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;
                            return PrimaryButton(
                              text: isLoading ? "Loading..." : "Create Account",
                              onPressed: isLoading
                                  ? () {}
                                  : () {
                                      context.read<AuthCubit>().register(
                                        RegisterRequest(
                                          name: nameController.text.trim(),
                                          email: emailController.text.trim(),
                                          phone: phoneController.text.trim(),
                                          password: passwordController.text.trim(),
                                        ),
                                      );
                                    },
                            );
                          },
                        ),
                        AuthFooter(
                          text: "Already have an account?",
                          actionText: "Log in",
                          onPressed: () => context.pop(),
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