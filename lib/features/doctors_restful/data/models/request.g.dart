// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsFilteringRequest _$DoctorsFilteringRequestFromJson(
        Map<String, dynamic> json) =>
    DoctorsFilteringRequest(
      priceFrom: (json['price_from'] as num).toDouble(),
      priceTo: (json['price_to'] as num).toDouble(),
      categoryId: json['category_id'] as String,
      cityId: json['city_id'] as String,
    );

Map<String, dynamic> _$DoctorsFilteringRequestToJson(
        DoctorsFilteringRequest instance) =>
    <String, dynamic>{
      'price_from': instance.priceFrom,
      'price_to': instance.priceTo,
      'category_id': instance.categoryId,
      'city_id': instance.cityId,
    };
