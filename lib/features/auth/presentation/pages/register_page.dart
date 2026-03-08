import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_header.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: const AppAppBar(title: "Create Account"),

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      AppSpacing.h32,

                      /// HEADER
                      const AuthHeader(
                        title: "Join EZmoney",
                        subtitle:
                        "Start your premium fintech journey today.",
                      ),

                      AppSpacing.h32,

                      /// FORM
                      RegisterForm(
                        nameController: nameController,
                        phoneController: phoneController,
                        emailController: emailController,
                        passwordController: passwordController,
                        formKey: formKey,
                      ),

                      AppSpacing.h20,

                      /// TERMS
                      const TermsText(),

                      const Spacer(),

                      /// BUTTON
                      PrimaryButton(
                        text: "Create Account",
                        onPressed: () {

                          if (formKey.currentState!.validate()) {

                            context.push(
                              RoutePaths.verifyIdentity,
                            );

                          }

                        },
                      ),

                      //AppSpacing.h16,

                      /// FOOTER
                      AuthFooter(
                        text: "Already have an account?",
                        actionText: "Log in",
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
}