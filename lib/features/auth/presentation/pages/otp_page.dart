import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_title_section.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/app_snackbar.dart';
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
        if (state is OtpVerifiedForRegister) {
          if (context.mounted) context.go(RoutePaths.setPin);
        }
        if (state is OtpVerifiedForReset) {
          if (context.mounted) {
            context.go(
              RoutePaths.resetPassword,
              extra: {"email": widget.email, "token": state.token},
            );
          }
        }
        if (state is AuthOtpResent) {
          if (context.mounted) {
            AppSnackBar.show(
              context,
              message: "Code sent successfully",
              type: SnackBarType.success,
            );
          }
        }
        if (state is AuthError) {
  if (context.mounted) {
    AppSnackBar.show(context, message: state.message);

    //  لو الايميل مش موجود → ارجع للـ register
    final msg = state.message.toLowerCase();
    if (msg.contains("not registered") || msg.contains("not found")) {
      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) context.go(RoutePaths.register);
      });
    }
  }
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
                        const AuthTitleSection(
                          icon: Icons.mark_email_unread_outlined,
                          title: "Verify your email",
                          description:
                              "Enter the 6-digit code we sent to\nyour email address.",
                        ),
                        AppSpacing.h40,
                        OtpInput(
                          onCompleted: (value) {
                            setState(() => otpCode = value);
                          },
                        ),
                        AppSpacing.h16,
                        ResendOtpSection(
                          onResend: () {
                            context.read<AuthCubit>().resendOtp(
                              email: widget.email,
                              type: widget.type,
                            );
                          },
                        ),
                        const Spacer(),
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