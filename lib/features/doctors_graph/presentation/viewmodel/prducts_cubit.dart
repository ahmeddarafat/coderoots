import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/product_usecase.dart';
import '../../domain/entities/product.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsUseCase _useCase;
  late List<ProductEntity> doctors;
  ProductsCubit(this._useCase) : super(const ProductsState.initial());

  Future<void> getDoctors(String id) async {
    emit(const ProductsState.loading());
    final result = await _useCase.execute(id);
    result.when(
      success: (data) {
        doctors = data;
        emit(ProductsState.success(data));
      },
      failure: (error) {
        log(error.toString(), name: "DoctorsCubit");
        emit(ProductsState.error(error.message));
      },
    );
  }
}
