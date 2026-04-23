part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AppAuthenticated extends AppState {}

class AppUnauthenticated extends AppState {}

class AppFirstTime extends AppState {}