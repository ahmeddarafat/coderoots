import 'package:flutter/material.dart';

import '../../../../../core/extension/sizedbox_extensions.dart';
import '../../../../../core/widget/public_text.dart';
import '../../../domain/entities/product.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            PublicText(
              text: "English Name: ${product.nameEn}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Arabic Name: ${product.nameAr}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Admin Comment: ${product.adminComment}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Attributes Id: ${product.attributesId}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Category Name: ${product.categoryName}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Category Id: ${product.categoryId}",
              size: 18,
            ),
            4.ph,
          ],
        ),
      ),
    );
  }
}