// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsResponse _$DoctorsResponseFromJson(Map<String, dynamic> json) =>
    DoctorsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorsResponseToJson(DoctorsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      address: json['address'] as String,
      category: (json['category'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num).toDouble(),
      biography: json['biography'] as String,
      cities: json['cities'] as String,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
      'address': instance.address,
      'category': instance.category,
      'price': instance.price,
      'biography': instance.biography,
      'cities': instance.cities,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name_en'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name_en': instance.name,
    };
