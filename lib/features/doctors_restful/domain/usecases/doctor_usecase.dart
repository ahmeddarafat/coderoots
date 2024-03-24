import 'package:coderoots/core/network/api_result.dart';
import 'package:coderoots/features/doctors_restful/data/models/response.dart';
import 'package:coderoots/features/doctors_restful/data/repos/doctors_repo.dart';
import 'package:coderoots/features/doctors_restful/domain/mapper/mapper.dart';
import 'package:coderoots/features/doctors_restful/domain/usecases/base_usecase.dart';

import '../../data/models/request.dart';

class DoctorsUseCase implements BaseUseCase<DoctorsFilter, List<Doctor>> {
  final DoctorRepo repository;

  DoctorsUseCase(this.repository);

  @override
  Future<ApiResult<List<Doctor>>> execute(DoctorsFilter input) async {
    final request = DoctorsFilteringRequest(
      priceFrom: input.priceFrom,
      priceTo: input.priceTo,
      categoryId: "659c11de870fb96c7a2c0057",
      cityId: "65ad623ec4d5a2a836c60ff6",
    );
    final repsonse = await repository.getDoctors(request);
    
    late ApiResult<List<Doctor>> result;
    repsonse.when(
      success: (data) {
        result = ApiResult.success(data.toEntity());
      },
      failure: (error) {
        result = ApiResult.failure(error);
      },
    );
    return result;
  }
}

class DoctorsFilter {
  final double priceFrom;
  final double priceTo;

  DoctorsFilter(this.priceFrom, this.priceTo);
}
