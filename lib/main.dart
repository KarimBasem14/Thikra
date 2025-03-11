// ignore_for_file: unused_import

import 'dart:developer';

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ذِكرى',
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const Root(),
    );
  }
}
