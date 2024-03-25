import 'dart:developer';

import 'package:coderoots/core/network/api_result.dart';
import 'package:coderoots/core/network/grahp_service.dart';
import 'package:coderoots/features/doctors_graph/data/queries/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/network/error_handler.dart' as eh;
import '../models/response.dart';

class ProductRepo {
  final GQService _gqService;

  ProductRepo(this._gqService);

  Future<ApiResult<ProductsResponse>> getDoctors(String id) async {
    try {
      final QueryResult<Object?> response = await _gqService.client.query(
        QueryOptions(
          document: gql(
            MyQueries.filterDoctor(),
          ),
          errorPolicy: ErrorPolicy.all,
        ),
      );

      // log(response.data.toString(), name: "DoctorRepo");
      final productsResponse = ProductsResponse.fromJson(response.data ?? {"products": []});
      return ApiResult.success(productsResponse);
    } catch (error) {
      log(error.toString(), name: "DoctorRepo");
      final handler = eh.ErrorHandler.handle(error);
      return ApiResult.failure(handler.failure);
    }
  }
}
