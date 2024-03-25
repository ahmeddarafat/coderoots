import 'package:coderoots/features/doctors_restful/presentation/viewmodel/doctors_cubit.dart';
import 'package:coderoots/features/shared/presentation/layouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/service_locator/service_locator.dart';
import 'features/doctors_graph/presentation/viewmodel/prducts_cubit.dart'
    as gql;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DoctorsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<gql.ProductsCubit>(),
        ),
      ],
      child: const MaterialApp(
        title: 'code roots',
        debugShowCheckedModeBanner: false,
        home: LayoutsPage(),
      ),
    );
  }
}
