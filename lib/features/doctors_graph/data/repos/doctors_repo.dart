import 'dart:developer';

import 'package:coderoots/core/network/api_result.dart';
import 'package:coderoots/core/network/grahp_service.dart';
import 'package:coderoots/features/doctors_graph/data/queries/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/network/error_handler.dart' as eh;
import '../models/request.dart';
import '../models/response.dart';

class DoctorRepo {
  final GQService _gqService;

  DoctorRepo(this._gqService);

  Future<ApiResult<DoctorsResponse>> getDoctors(
      DoctorsFilteringRequest request) async {
    try {
      final response = await _gqService.client.value.query(
        QueryOptions(
          document: gql(
            MyQueries.filterDoctor(),
          ),
        ),
      );

      final doctorsResponse = DoctorsResponse.fromJson(response.data!);
      return ApiResult.success(doctorsResponse);
    } catch (error) {
      log(error.toString(), name: "DoctorRepo");
      final handler = eh.ErrorHandler.handle(error);
      return ApiResult.failure(handler.failure);
    }
  }
}
