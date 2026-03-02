import 'package:equatable/equatable.dart';

enum AppStatus {
  initial,
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  final AppStatus status;

  const AppState({this.status = AppStatus.initial});

  AppState copyWith({AppStatus? status}) {
    return AppState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}