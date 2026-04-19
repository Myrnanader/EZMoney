import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/wallet/presentation/widgets/card_input_field.dart';
import 'package:e_wallet/shared/widgets/app_date_picker_field.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddCardForm extends StatelessWidget {
  const AddCardForm({super.key});

  @override
  Widget build(BuildContext context) {
    final numberController = TextEditingController();
    final nameController = TextEditingController();
    final expiryController = TextEditingController();
    final cvvController = TextEditingController();

    final cardFormatter = MaskTextInputFormatter(mask: '#### #### #### ####');

    return Column(
      children: [
        CardInputField(
          controller: numberController,
          label: "CARD NUMBER",
          hint: "0000 0000 0000 0000",
          icon: Icons.credit_card_outlined,
          inputFormatters: [cardFormatter],
        ),

        AppSpacing.h16,

        CardInputField(
          controller: nameController,
          label: "CARDHOLDER NAME",
          hint: "Full Name",
          icon: Icons.person_outline,
        ),

        AppSpacing.h16,

        Row(
          children: [
            Expanded(
              child: AppDatePickerField(
                controller: expiryController,
                label: "EXPIRY DATE",
                icon: Icons.calendar_today_outlined,
              ),
            ),

            AppSpacing.w12,

            Expanded(
              child: CardInputField(
                controller: cvvController,
                label: "CVV",
                hint: "•••",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
            ),
          ],
        ),

        AppSpacing.h16,

        Row(
          children: [
            const Icon(
              Icons.verified_user,
              size: 16,
              color: AppColors.textLight,
            ),

            AppSpacing.w8,

            const Expanded(
              child: Text(
                "Your card data is encrypted and secure",
                style: TextStyle(color: AppColors.textLight, fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
