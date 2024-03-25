
import '../../data/models/response.dart';
import '../entities/product.dart';

extension DoctorMapper on ProductsResponse {
  List<ProductEntity> toEntity() {
    return products.map((doctor) {
      return ProductEntity(
        nameEn: doctor.nameEn ?? "Unknown",
        nameAr: doctor.nameAr ?? "Unknown",
        adminComment: doctor.adminComment ?? "Unknown",
        attributesId: doctor.attributes?.id ?? "Unknown",
        categoryName: doctor.category?.name ?? "Unknown",
        categoryId: doctor.category?.id ?? "Unknown",
        
      );
    }).toList();
  }
}
