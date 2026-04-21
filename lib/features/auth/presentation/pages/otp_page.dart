/*import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_title_section.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_wallet/features/auth/presentation/widgets/otp_input.dart';
import 'package:e_wallet/features/auth/presentation/widgets/otp_timer.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: const AppAppBar(title: "Verification"),

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
                        icon: Icons.mark_email_unread_outlined,
                        title: "Verify your email",
                        description:
                        "Enter the 6-digit code we sent to\nyour email address.",
                      ),

                      AppSpacing.h40,

                      /// OTP INPUT
                      OtpInput(
                        onCompleted: (value) {
                          // verify otp
                        },
                      ),

                      AppSpacing.h16,

                      /// TIMER
                      const OtpTimer(time: "00:54"),

                      const Spacer(),

                      /// VERIFY BUTTON
                      PrimaryButton(
                        text: "Verify Code",
                        onPressed: () {
                          context.push(RoutePaths.resetPassword);
                        },
                      ),

                      AppSpacing.h24,

                      /// RESEND
                      TextButton(
                        onPressed: () {},

                        child: Text(
                          "Resend code",
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
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
import 'package:e_wallet/features/auth/presentation/widgets/otp_input.dart';
import 'package:e_wallet/features/auth/presentation/widgets/resend_otp_section.dart';

class OtpPage extends StatefulWidget {
  final String email;
  final String type;

  const OtpPage({super.key, required this.email, required this.type});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        print("OTP STATE => $state"); //  debug مهم

        if (state is OtpVerifiedForRegister) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(RoutePaths.setPin);
          });
        }

        if (state is OtpVerifiedForReset) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(
              RoutePaths.resetPassword,
              extra: {"email": widget.email, "token": state.token},
            );
          });
        }

        if (state is AuthOtpResent) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("OTP sent again")));
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const AppAppBar(title: "Verification"),

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
                          icon: Icons.mark_email_unread_outlined,
                          title: "Verify your email",
                          description:
                              "Enter the 6-digit code we sent to\nyour email address.",
                        ),

                        AppSpacing.h40,

                        /// OTP INPUT
                        OtpInput(
                          onCompleted: (value) {
                            otpCode = value;
                          },
                        ),

                        AppSpacing.h16,

                        ///  RESEND + TIMER
                        ResendOtpSection(
                          onResend: () {
                            context.read<AuthCubit>().resendOtp(
                              email: widget.email,
                              type: widget.type,
                            );
                          },
                        ),

                        const Spacer(),

                        /// VERIFY BUTTON
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;

                            return PrimaryButton(
                              text: isLoading ? "Verifying..." : "Verify Code",
                              onPressed: isLoading || otpCode.length != 6
                                  ? () {}
                                  : () {
                                      context.read<AuthCubit>().verifyOtp(
                                        email: widget.email,
                                        otp: otpCode,
                                        type: widget.type,
                                      );
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
