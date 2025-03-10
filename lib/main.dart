import 'dart:developer';

import 'package:muslim_azkar/MainScreens/root.dart';
import 'package:flutter/material.dart';
import 'package:muslim_azkar/api/notificationapi.dart';
import 'package:muslim_azkar/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> enableNotifications() async {
  // Initialize time zone datas
  tz.initializeTimeZones(); // This is a very important line, without it the NotificationService's sheduleNotification method raises a late initialization error

  await NotificationService.init(); // Initalize the NotificationService

  await NotificationService.enableDailyNotifications(
      true); // Enables Notifications to be repeated on a daily basis
}

Future<void> initNotifications() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('isNotificationsEnabled') == null) {
    await enableNotifications();
    log("enableNotifications called from main");
  } else if (prefs.getBool('isNotificationsEnabled')!) {
    await enableNotifications();
    log("enableNotifications called from main");
  } else {
    await NotificationService.enableDailyNotifications(false);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muslim Azkar',
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const Root(),
    );
  }
}
