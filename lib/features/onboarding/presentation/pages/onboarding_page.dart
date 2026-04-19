import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/features/onboarding/data/onboarding_data.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'package:e_wallet/features/onboarding/presentation/widgets/onboarding_dots.dart';
import 'package:e_wallet/features/onboarding/presentation/widgets/onboarding_item_card.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentIndex == onboardingItems.length - 1;

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      context.go(RoutePaths.welcome);
                    },
                  ),

                  TextButton(
                    onPressed: () {
                      context.go(RoutePaths.login);
                    },
                    child: Text(
                      "Skip",
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            AppSpacing.h24,

            /// PAGEVIEW
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingItems.length,

                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },

                itemBuilder: (context, index) {
                  final item = onboardingItems[index];

                  return OnboardingItemCard(
                    image: item.image,
                    title: item.title,
                    description: item.description,
                  );
                },
              ),
            ),

            OnboardingDots(count: onboardingItems.length, index: currentIndex),

            AppSpacing.h24,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),

              child: PrimaryButton(
                text: isLastPage ? "Get Started" : "Next",

                onPressed: () {
                  if (isLastPage) {
                    context.go(RoutePaths.login);
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),

            AppSpacing.h40,
          ],
        ),
      ),
    );
  }
}
