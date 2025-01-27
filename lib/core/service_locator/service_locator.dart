import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

import '../cache/app_prefs.dart';
import '../network/dio_service.dart';
import '../../features/doctors_restful/data/repos/doctors_repo.dart';
import '../../features/doctors_restful/domain/usecases/doctor_usecase.dart';
import '../../features/doctors_restful/presentation/viewmodel/doctors_cubit.dart';
import '../../features/doctors_graph/data/repos/products_repo.dart';
import '../../features/doctors_graph/domain/usecases/product_usecase.dart';
import '../../features/doctors_graph/presentation/viewmodel/prducts_cubit.dart';
import '../network/grahp_service.dart';
import '../network/network_info.dart';

final GetIt getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  /// Shared prefs
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(
    () => AppPrefs(sharedPrefs),
  );

  /// api service
  getIt.registerLazySingleton(() => DioService());
  getIt.registerLazySingleton(() => GQService());

  /// network checker
  getIt.registerLazySingleton(
    () => NetworkInfo(
      InternetConnectionChecker(),
    ),
  );

  /// doctor restful
  getIt.registerLazySingleton(() => DoctorRepo(getIt()));
  getIt.registerLazySingleton(() => DoctorsUseCase(getIt()));
  getIt.registerLazySingleton(() => DoctorsCubit(getIt()));

  /// doctor graph
  getIt.registerLazySingleton(() => ProductRepo(getIt()));
  getIt.registerLazySingleton(() => ProductsUseCase(getIt()));
  getIt.registerLazySingleton(() => ProductsCubit(getIt()));
}
