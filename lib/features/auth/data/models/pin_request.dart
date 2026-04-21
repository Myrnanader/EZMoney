import 'package:json_annotation/json_annotation.dart';

part 'pin_request.g.dart';

@JsonSerializable()
class PinRequest {
  final String pin;

  @JsonKey(name: 'pin_confirmation')
  final String pinConfirmation;

  PinRequest({
    required this.pin,
    required this.pinConfirmation,
  });

  factory PinRequest.fromJson(Map<String, dynamic> json) =>
      _$PinRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PinRequestToJson(this);
}