import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/features/wallet/presentation/pages/empty_wallet_page.dart';
import 'package:e_wallet/features/wallet/presentation/pages/wallet_home_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int index = 0;

  final pages = const [
    WalletHomePage(),

    EmptyWalletPage(),

    Center(child: Text("Activity")),

    Center(child: Text("Groups")),

    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: pages[index],

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: index,

        onTap: (i) {
          setState(() {
            index = i;
          });
        },

        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            selectedColor: AppColors.primary,
            unselectedColor: AppColors.grey,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text("Wallet"),
            selectedColor: AppColors.primary,
            unselectedColor: AppColors.grey,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.history),
            title: const Text("Activity"),
            selectedColor: AppColors.primary,
            unselectedColor: AppColors.grey,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.groups),
            title: const Text("Groups"),
            selectedColor: AppColors.primary,
            unselectedColor: AppColors.grey,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.person_outline),
            title: const Text("Profile"),
            selectedColor: AppColors.primary,
            unselectedColor: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
