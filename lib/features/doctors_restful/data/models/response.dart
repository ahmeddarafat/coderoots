import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class DoctorsResponse {
  final List<Doctor> data;

  DoctorsResponse({required this.data});

  factory DoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorsResponseFromJson(json);
}

@JsonSerializable()
class Doctor {
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String address;
  final Category category;
  final double price;
  final String biography;
  final String cities;

  Doctor({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.category,
    required this.price,
    required this.biography,
    required this.cities,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}

@JsonSerializable()
class Category {
  @JsonKey(name: 'name_en')
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
