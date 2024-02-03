import 'dart:async';

import 'package:emi_calculator/i18n/strings.g.dart';
import 'package:emi_calculator/init_app.dart';
import 'package:emi_calculator/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  await AppInitializer.initDependency();
  runApp(TranslationProvider(child: const MyApp()));
}
