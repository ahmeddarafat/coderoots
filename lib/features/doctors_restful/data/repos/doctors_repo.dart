import 'package:coderoots/core/network/api_constants.dart';
import 'package:coderoots/core/network/api_result.dart';
import 'package:coderoots/core/network/dio_service.dart';
import 'package:coderoots/features/doctors_restful/data/models/request.dart';
import 'package:coderoots/features/doctors_restful/data/models/response.dart';

import '../../../../core/network/error_handler.dart';

class DoctorRepo {
  final DioService _apiService;

  DoctorRepo(this._apiService);

  Future<ApiResult<DoctorsResponse>> getDoctors(
      DoctorsFilteringRequest request) async {
    try {
      final response = await _apiService.postData(
        endPoint: ApiEndPoints.doctorFilter,
        body: request.toJson(),
      );
      final doctorsResponse = DoctorsResponse.fromJson(response.data);
      return ApiResult.success(doctorsResponse);
    } catch (error) {
      final handler = ErrorHandler.handle(error);
      return ApiResult.failure(handler.failure);
    }
  }
}
