/*import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_header.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:e_wallet/features/auth/presentation/widgets/encryption_label.dart';
import 'package:e_wallet/features/auth/presentation/widgets/pin_dots.dart';
import 'package:e_wallet/features/auth/presentation/widgets/pin_keyboard.dart';

class SetPinPage extends StatefulWidget {
  const SetPinPage({super.key});

  @override
  State<SetPinPage> createState() => _SetPinPageState();
}

class _SetPinPageState extends State<SetPinPage> {
  String pin = "";

  /// ADD DIGIT
  void addDigit(String digit) {
    if (pin.length >= 4) return;

    setState(() {
      pin += digit;
    });

    if (pin.length == 4) {
      Future.delayed(const Duration(milliseconds: 200), () {
        context.go(RoutePaths.walletReady);
      });
    }
  }

  /// REMOVE DIGIT
  void removeDigit() {
    if (pin.isEmpty) return;

    setState(() {
      pin = pin.substring(0, pin.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: const AppAppBar(title: "Set Transaction PIN"),

      body: SafeArea(
        child: Column(
          children: [
            AppSpacing.h32,

            const AuthHeader(
              title: "Set your 4-digit PIN",
              subtitle:
                  "This PIN will be used to confirm your payments and transfers securely.",
            ),

            AppSpacing.h40,

            /// PIN DOTS
            PinDots(length: 4, filled: pin.length),

            const Spacer(),

            /// ENCRYPTION TEXT
            const EncryptionLabel(),

            AppSpacing.h16,

            /// KEYBOARD
            PinKeyboard(onKey: addDigit, onBackspace: removeDigit),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_header.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:e_wallet/features/auth/presentation/widgets/encryption_label.dart';
import 'package:e_wallet/features/auth/presentation/widgets/pin_dots.dart';
import 'package:e_wallet/features/auth/presentation/widgets/pin_keyboard.dart';

class SetPinPage extends StatefulWidget {
  const SetPinPage({super.key});

  @override
  State<SetPinPage> createState() => _SetPinPageState();
}

class _SetPinPageState extends State<SetPinPage> {
  String pin = "";
  String confirmPin = "";
  bool isConfirming = false;

  static const int pinLength = 4;

  /// ADD DIGIT
  void addDigit(String digit) {
    final isLoading = context.read<AuthCubit>().state is AuthLoading;

    ///  منع الإدخال أثناء اللودينج
    if (isLoading) return;

    if (!isConfirming) {
      if (pin.length >= pinLength) return;

      setState(() {
        pin += digit;
      });

      ///  أول ما يكمل → يدخل confirm mode
      if (pin.length == pinLength) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (!mounted) return;
          setState(() {
            isConfirming = true;
          });
        });
      }
    } else {
      if (confirmPin.length >= pinLength) return;

      setState(() {
        confirmPin += digit;
      });

      ///  لما يخلص confirm
      if (confirmPin.length == pinLength) {
        if (pin == confirmPin) {
          ///  API CALL
          context.read<AuthCubit>().setPin(pin, confirmPin);
        } else {
          ///  Reset نظيف + UX أحسن
          Future.delayed(const Duration(milliseconds: 200), () {
            if (!mounted) return;

            setState(() {
              pin = "";
              confirmPin = "";
              isConfirming = false;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("PINs do not match, try again")),
            );
          });
        }
      }
    }
  }

  /// REMOVE DIGIT
  void removeDigit() {
    final isLoading = context.read<AuthCubit>().state is AuthLoading;

    ///  منع الحذف أثناء اللودينج
    if (isLoading) return;

    if (!isConfirming) {
      if (pin.isEmpty) return;

      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    } else {
      if (confirmPin.isEmpty) return;

      setState(() {
        confirmPin = confirmPin.substring(0, confirmPin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        ///  success → next screen
        if (state is AuthSuccess) {
          context.go(RoutePaths.walletReady);
        }

        ///  error
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const AppAppBar(title: "Set Transaction PIN"),
        body: SafeArea(
          child: Column(
            children: [
              AppSpacing.h32,

              /// HEADER
              AuthHeader(
                title: isConfirming
                    ? "Confirm your PIN"
                    : "Set your 4-digit PIN",
                subtitle:
                    "This PIN will be used to confirm your payments and transfers securely.",
              ),

              AppSpacing.h40,

              /// PIN DOTS
              PinDots(
                length: pinLength,
                filled: isConfirming ? confirmPin.length : pin.length,
              ),

              const Spacer(),

              /// LOADING
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator();
                  }
                  return const SizedBox();
                },
              ),

              /// ENCRYPTION TEXT
              const EncryptionLabel(),

              AppSpacing.h16,

              /// KEYBOARD
              PinKeyboard(onKey: addDigit, onBackspace: removeDigit),
            ],
          ),
        ),
      ),
    );
  }
}
