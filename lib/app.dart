import 'package:e_wallet/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

class EZMoneyApp extends StatelessWidget {
  const EZMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>(); //  مهم

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,

          ///  هنا الحل الحقيقي
          routerConfig: AppRouter.createRouter(appCubit),

          builder: (context, child) {
            return ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: const [
                Breakpoint(start: 0, end: 450, name: MOBILE),
                Breakpoint(start: 451, end: 800, name: TABLET),
                Breakpoint(start: 801, end: 1920, name: DESKTOP),
              ],
            );
          },
        );
      },
    );
  }
}