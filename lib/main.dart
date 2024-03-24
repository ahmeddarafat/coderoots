import 'package:coderoots/app.dart';
import 'package:flutter/material.dart';

import 'core/service_locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServiceLocator();

  runApp(const MyApp());
}
