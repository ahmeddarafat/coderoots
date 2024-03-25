import 'package:flutter/material.dart';

import '../../../../../core/extension/sizedbox_extensions.dart';
import '../../../../../core/widget/public_text.dart';
import '../../../domain/entities/doctor.dart';


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
              text: "Name: ${doctor.name}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Email: ${doctor.email}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Mobile: ${doctor.mobile}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Address: ${doctor.address}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Category: ${doctor.category}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Price: ${doctor.price}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "Biography: ${doctor.biography}",
              size: 18,
            ),
            4.ph,
            PublicText(
              text: "City: ${doctor.cities}",
              size: 18,
            ),
            4.ph,
          ],
        ),
      ),
    );
  }
}