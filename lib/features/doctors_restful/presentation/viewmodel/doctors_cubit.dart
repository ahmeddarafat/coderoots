import 'dart:developer';

import 'package:coderoots/features/doctors_restful/domain/usecases/doctor_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/doctor.dart';
import 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final DoctorsUseCase _useCase;
  late List<DoctorEntity> doctors;
  DoctorsCubit(this._useCase) : super(const DoctorsState.initial());

  Future<void> getDoctors(double priceFrom, double priceTo) async {
    emit(const DoctorsState.loading());
    final result = await _useCase.execute(DoctorsFilter(priceFrom, priceTo));
    result.when(
      success: (data) {
        doctors = data;
        emit(DoctorsState.success(data));
      },
      failure: (error) {
        log(error.toString(), name: "DoctorsCubit");
        emit(DoctorsState.error(error.message));
      },
    );
  }
}
