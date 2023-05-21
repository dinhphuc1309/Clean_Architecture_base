import 'package:clean_archtecture_base/app.dart';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  runApp(const App());
}
