// ignore_for_file: unused_import

import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter/material.dart';
import 'package:muslim_azkar/Api/favoriteHadithBox.dart' show favoriteHadithBox;
import 'package:muslim_azkar/Api/favouriteDuasBox.dart'
    show favouriteQuranDuasBox, favouriteSunnahDuasBox;
import 'package:muslim_azkar/root.dart' show Root;
import 'package:muslim_azkar/theme.dart' show darkTheme, lightTheme;

import 'package:timezone/data/latest.dart' as tz;

import 'Api/notificationapi.dart' show NotificationService;

import 'package:muslim_azkar/Widgets/overlay_widget.dart' show OverlayWidget;

// // overlay entry point
// @pragma("vm:entry-point")
// void overlayMain() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: OverlayWidget(),
//     ),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  await Hive.initFlutter();
  favoriteHadithBox = await Hive.openBox("favoriteHadithBox");
  favouriteQuranDuasBox = await Hive.openBox("favouriteQuranDuasBox");
  favouriteSunnahDuasBox = await Hive.openBox("favouriteSunnahDuasBox");
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
