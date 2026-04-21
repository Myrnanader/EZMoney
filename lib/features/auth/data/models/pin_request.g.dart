// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinRequest _$PinRequestFromJson(Map<String, dynamic> json) => PinRequest(
  pin: json['pin'] as String,
  pinConfirmation: json['pin_confirmation'] as String,
);

Map<String, dynamic> _$PinRequestToJson(PinRequest instance) =>
    <String, dynamic>{
      'pin': instance.pin,
      'pin_confirmation': instance.pinConfirmation,
    };
