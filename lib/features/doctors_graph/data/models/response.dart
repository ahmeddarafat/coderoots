import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ProductsResponse {
  final List<Product> products;

  ProductsResponse({required this.products});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "name_en")
  final String? nameEn;
  @JsonKey(name: "name_ar")
  final String? nameAr;
  @JsonKey(name: "admin_comment")
  final String? adminComment;
  final Category? category;
  final Attributes? attributes;

  Product({
    required this.nameEn,
    required this.nameAr,
    required this.adminComment,
    required this.category,
    required this.attributes,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@JsonSerializable()
class Category {
  @JsonKey(name: 'name_en')
  final String? name;
  final int? id;

  Category({required this.name, required this.id});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@JsonSerializable()
class Attributes {
  final int? id;

  Attributes({required this.id});

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}
