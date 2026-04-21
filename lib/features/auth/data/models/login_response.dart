import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool status;
  final String message;
  final LoginData data;

  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final User user;
  final Auth auth;

  LoginData({required this.user, required this.auth});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String email;
  final String phone;

  @JsonKey(name: 'created_at')
  final String createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Auth {
  final String token;

  @JsonKey(name: 'token_type')
  final String tokenType;

  Auth({required this.token, required this.tokenType});

  factory Auth.fromJson(Map<String, dynamic> json) =>
      _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}