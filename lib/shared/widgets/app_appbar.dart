import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const AppAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return AppBar(

      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,

      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => context.pop(),
      ),

      title: Text(title,
        style: AppTextStyles.heading2,
      ),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}