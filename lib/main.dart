// ignore_for_file: unused_import

import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:muslim_azkar/MainScreens/root.dart';
import 'package:flutter/material.dart';
import 'package:muslim_azkar/api/notificationapi.dart';
import 'package:muslim_azkar/api/notificationapiv2.dart';
import 'package:muslim_azkar/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(
    savedThemeMode: savedThemeMode,
  ));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, required this.savedThemeMode});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.dark,
      builder: (lightTheme, darkTheme) => MaterialApp(
        title: 'ذِكرى',
        darkTheme: darkTheme,
        theme: lightTheme,
        home: const Root(),
      ),
    );
  }
}
