import 'package:json_annotation/json_annotation.dart';
import 'error_handler.dart';

part "failure.g.dart";

@JsonSerializable()
class Failure {
  final int code;
  final String message;

  Failure({
    this.code = ResponseCode.unknown,
    this.message = ResponseMessage.unknown,
  });

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);

  Map<String, dynamic> toJson() => _$FailureToJson(this);
}
