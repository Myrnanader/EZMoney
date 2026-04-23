import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_header.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_wallet/features/auth/presentation/widgets/encryption_label.dart';
import 'package:e_wallet/features/auth/presentation/widgets/pin_dots.dart';

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

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _hiddenController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _hiddenController.dispose();
    super.dispose();
  }

  void _onInput(String value) {
    final isLoading = context.read<AuthCubit>().state is AuthLoading;
    if (isLoading) return;

    _hiddenController.clear();

    if (!isConfirming) {
      if (value.isEmpty) {
        if (pin.isEmpty) return;
        setState(() => pin = pin.substring(0, pin.length - 1));
      } else {
        if (pin.length >= pinLength) return;
        final digit = value.replaceAll(RegExp(r'[^0-9]'), '');
        if (digit.isEmpty) return;
        setState(() => pin += digit[0]);

        if (pin.length == pinLength) {
          Future.delayed(const Duration(milliseconds: 300), () {
            if (!mounted) return;
            setState(() => isConfirming = true);
            _focusNode.requestFocus();
          });
        }
      }
    } else {
      if (value.isEmpty) {
        if (confirmPin.isEmpty) return;
        setState(() => confirmPin = confirmPin.substring(0, confirmPin.length - 1));
      } else {
        if (confirmPin.length >= pinLength) return;
        final digit = value.replaceAll(RegExp(r'[^0-9]'), '');
        if (digit.isEmpty) return;
        setState(() => confirmPin += digit[0]);

        if (confirmPin.length == pinLength) {
          if (pin == confirmPin) {
            context.read<AuthCubit>().setPin(pin, confirmPin);
          } else {
            Future.delayed(const Duration(milliseconds: 200), () {
              if (!mounted) return;
              setState(() {
                pin = "";
                confirmPin = "";
                isConfirming = false;
              });
              _focusNode.requestFocus();
              AppSnackBar.show(context, message: "PINs do not match, try again");
            });
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) context.go(RoutePaths.walletReady);
        if (state is AuthError) AppSnackBar.show(context, message: state.message);
      },
      child: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: const AppAppBar(title: "Set Transaction PIN"),
          body: SafeArea(
            child: Column(
              children: [
                AppSpacing.h32,
                AuthHeader(
                  title: isConfirming ? "Confirm your PIN" : "Set your 4-digit PIN",
                  subtitle: "This PIN will be used to confirm your payments and transfers securely.",
                ),
                AppSpacing.h40,
                PinDots(
                  length: pinLength,
                  filled: isConfirming ? confirmPin.length : pin.length,
                ),
                const Spacer(),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return const SizedBox();
                  },
                ),
                const EncryptionLabel(),
                AppSpacing.h32,
                SizedBox(
                  height: 1,
                  width: 1,
                  child: TextField(
                    controller: _hiddenController,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    obscureText: true,
                    enableInteractiveSelection: false,
                    showCursor: false,
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: _onInput,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}