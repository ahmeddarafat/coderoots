// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failure _$FailureFromJson(Map<String, dynamic> json) => Failure(
      code: json['code'] as int? ?? ResponseCode.unknown,
      message: json['message'] as String? ?? ResponseMessage.unknown,
    );

Map<String, dynamic> _$FailureToJson(Failure instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
