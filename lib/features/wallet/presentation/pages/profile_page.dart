import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          // FIX: mounted check
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const AppAppBar(title: "Profile"),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              PrimaryButton(
                text: "Logout",
                onPressed: () {
                  // ✅ FIX: مش await عشان نخلي الـ navigation يحصل من الـ Router
                  context.read<AuthCubit>().logout();
                },
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}