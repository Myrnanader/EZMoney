import 'package:e_wallet/core/di/di.dart';
import 'package:e_wallet/features/app/presentation/cubit/app_cubit.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthCubit>()),
        BlocProvider(create: (_) => sl<AppCubit>()..checkAuth()),
      ],
      child: const EZMoneyApp(),
    ),
  );
}
