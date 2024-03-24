import 'package:coderoots/features/doctors_restful/data/models/response.dart';

extension DoctorMapper on DoctorsResponse {
  List<Doctor> toEntity() {
    return data.map((doctor) {
      return Doctor(
        firstName: doctor.firstName,
        lastName: doctor.lastName,
        email: doctor.email,
        mobile: doctor.mobile,
        address: doctor.address,
        category: doctor.category,
        price: doctor.price,
        biography: doctor.biography,
        cities: doctor.cities,
      );
    }).toList();
  }
}
