import 'package:coderoots/features/doctors_restful/data/models/response.dart';
import 'package:coderoots/features/doctors_restful/domain/entities/doctor.dart';

extension DoctorMapper on DoctorsResponse {
  List<DoctorEntity> toEntity() {
    return data.map((doctor) {
      return DoctorEntity(
        name: "${doctor.firstName} ${doctor.lastName}",
        email: doctor.email,
        mobile: doctor.mobile,
        address: doctor.address,
        category: doctor.category[0].name,
        price: doctor.price,
        biography: doctor.biography,
        cities: doctor.cities,
      );
    }).toList();
  }
}
