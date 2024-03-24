import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../cache/app_prefs.dart';
import '../network/dio_service.dart';

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

  /// network checker
  getIt.registerLazySingleton(
    () => NetworkInfo(
      InternetConnectionChecker(),
    ),
  );
}
