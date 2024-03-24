import 'package:coderoots/core/extension/sizedbox_extensions.dart';
import 'package:coderoots/core/widget/public_text.dart';
import 'package:coderoots/features/doctors_restful/domain/entities/doctor.dart';
import 'package:flutter/material.dart';


class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctor,
  });

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            PublicText(
              text: doctor.name,
              size: 20,
              fw: FontWeight.bold,
            ),
            4.ph,
            PublicText(
              text: doctor.email,
              size: 19,
              fw: FontWeight.bold,
            ),
            4.ph,
            PublicText(
              text: doctor.mobile,
              size: 18,
              fw: FontWeight.bold,
            ),
            4.ph,
            PublicText(
              text: doctor.address,
              size: 17,
              fw: FontWeight.w500,
            ),
            4.ph,
            PublicText(
              text: doctor.category,
              size: 16,
              fw: FontWeight.w500,
            ),
            4.ph,
            PublicText(
              text: doctor.price.toString(),
              size: 15,
              fw: FontWeight.w500,
            ),
            4.ph,
            PublicText(
              text: doctor.biography,
              size: 14,
            ),
            4.ph,
            PublicText(
              text: doctor.cities,
              size: 14,
            ),
            4.ph,
          ],
        ),
      ),
    );
  }
}