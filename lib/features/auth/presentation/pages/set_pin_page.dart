import 'package:e_wallet/core/routing/route_paths.dart';
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
