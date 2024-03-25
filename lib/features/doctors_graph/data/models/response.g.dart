// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      nameEn: json['name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      adminComment: json['admin_comment'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      attributes: json['attributes'] == null
          ? null
          : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name_en': instance.nameEn,
      'name_ar': instance.nameAr,
      'admin_comment': instance.adminComment,
      'category': instance.category,
      'attributes': instance.attributes,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name_en'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name_en': instance.name,
      'id': instance.id,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
