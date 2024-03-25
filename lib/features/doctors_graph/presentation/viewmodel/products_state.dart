import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = LoadingState;
  const factory ProductsState.success(List<ProductEntity> doctors) = SuccessState;
  const factory ProductsState.error(String message) = ErrorState;
}
