import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/doctor.dart';

part 'doctors_state.freezed.dart';

@freezed
class DoctorsState with _$DoctorsState {
  const factory DoctorsState.initial() = _Initial;
  const factory DoctorsState.loading() = LoadingState;
  const factory DoctorsState.success(List<DoctorEntity> doctors) = SuccessState;
  const factory DoctorsState.error(String message) = ErrorState;
}
