import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/public_text.dart';
import '../../presentation/viewmodel/doctors_state.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../viewmodel/doctors_cubit.dart';
import 'components/doctor_card.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  late final DoctorsCubit bloc;

  @override
  void initState() {
    super.initState();
    bloc = getIt<DoctorsCubit>();
    bloc.getDoctors(0, 500);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctors'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: BlocBuilder<DoctorsCubit, DoctorsState>(
            buildWhen: (_, current) {
              return current is LoadingState ||
                  current is SuccessState ||
                  current is ErrorState;
            },
            builder: (context, state) {
              return state.maybeWhen(
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  success: (_) {
                    return ListView.separated(
                      itemCount: bloc.doctors.length,
                      separatorBuilder: (_, __) =>  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(color: Colors.grey[300],),
                      ),
                      itemBuilder: (_, index) {
                        final doctor = bloc.doctors[index];
                        return DoctorCard(doctor: doctor);
                      },
                    );
                  },
                  error: (message) {
                    return Center(
                      child: PublicText(
                        text: message,
                        color: Colors.red,
                      ),
                    );
                  },
                  orElse: () => const SizedBox.shrink());
            },
          ),
        ),
      ),
    );
  }
}
