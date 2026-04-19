import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/wallet/presentation/widgets/add_card_form.dart';
import 'package:e_wallet/features/wallet/presentation/widgets/credit_card_preview.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppAppBar(title: "Add Payment Method"),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),

              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),

                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      AppSpacing.h16,

                      const CreditCardPreview(),

                      AppSpacing.h24,

                      const AddCardForm(),

                      const Spacer(),

                      PrimaryButton(
                        text: "Add Card",
                        icon: Icons.add_card_outlined,
                        onPressed: () {
                          context.push(RoutePaths.verifyCard);
                        },
                      ),

                      AppSpacing.h24,
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
