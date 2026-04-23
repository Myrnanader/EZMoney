import 'package:e_wallet/core/di/di.dart';
import 'package:e_wallet/features/app/presentation/cubit/app_cubit.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

  final appCubit = sl<AppCubit>()..checkAuth();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: appCubit),
        BlocProvider(create: (_) => sl<AuthCubit>()),
      ],
      child: const EZMoneyApp(),
    ),
  );
}
