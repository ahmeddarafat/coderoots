
import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class DoctorsFilteringRequest {
  @JsonKey(name: 'price_from')
  final double priceFrom;
  @JsonKey(name: 'price_to')
  final double priceTo;
  @JsonKey(name: 'category_id')
  final String categoryId;
  @JsonKey(name: 'city_id')
  final String cityId;

  DoctorsFilteringRequest({
    required this.priceFrom,
    required this.priceTo,
    required this.categoryId,
    required this.cityId,
  });

  Map<String, dynamic> toJson() => _$DoctorsFilteringRequestToJson(this);
  }

  

