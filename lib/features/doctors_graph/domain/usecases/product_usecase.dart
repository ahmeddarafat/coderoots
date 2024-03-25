import 'dart:developer';

import '../../../../core/network/api_result.dart';
import '../mapper/mapper.dart';
import '../../data/models/request.dart';
import '../../data/repos/products_repo.dart';
import '../entities/product.dart';
import 'base_usecase.dart';

class ProductsUseCase implements BaseUseCase<String, List<ProductEntity>> {
  final ProductRepo repository;

  ProductsUseCase(this.repository);

  @override
  Future<ApiResult<List<ProductEntity>>> execute(String id) async {
    final repsonse = await repository.getDoctors(id);

    late ApiResult<List<ProductEntity>> result;
    repsonse.when(
      success: (data) {
        result = ApiResult.success(data.toEntity());
      },
      failure: (error) {
        log(error.toString(), name: "DoctorsUseCase");
        result = ApiResult.failure(error);
      },
    );
    return result;
  }
}
