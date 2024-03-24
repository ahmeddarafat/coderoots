import 'package:coderoots/features/doctors_restful/presentation/viewmodel/doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/service_locator/service_locator.dart';
import 'features/doctors_restful/presentation/view/doctor_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DoctorsCubit>(),
      child: const MaterialApp(
        title: 'code roots',
        debugShowCheckedModeBanner: false,
        home: DoctorPage(),
      ),
    );
  }
}
