// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:developer' show log;
import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:muslim_azkar/data/duas.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz show initializeTimeZones;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<TimeOfDay> get morningTime async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? MORNING_HOUR = prefs.getInt('morning_hour') ?? 7;
    int? MORNING_MINUTE = prefs.getInt('morning_minute') ?? 30;
    return TimeOfDay(hour: MORNING_HOUR, minute: MORNING_MINUTE);
  }

  static Future<TimeOfDay> get nightTime async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? NIGHT_HOUR = prefs.getInt('night_hour') ?? 17;
    int? NIGHT_MINUTE = prefs.getInt('night_minute') ?? 00;
    return TimeOfDay(hour: NIGHT_HOUR, minute: NIGHT_MINUTE);
  }

  // This controls what happens when the user clicks on the notification
  static Future<void> onDidReceiveNotification(
      NotificationResponse notificationResponse) async {
    log("Notification clicked: ${notificationResponse.payload}");
  }

  static Future<void> initServiceSettings() async {
    /*
    *  This function initializes the settings and configurations for Andriod and IOS notifications
    */

    // Initialize time zone datas
    tz.initializeTimeZones(); // This is a very important line, without it the NotificationService's sheduleNotification method raises a late initialization error

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true);

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    final bool? initialized = await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
    );

    log("Notifications Settings Initialized: $initialized",
        name: "NotificationService");
  }

  static Future<void> init() async {
    log("enableNotifications called from main");
    await NotificationService
        .initServiceSettings(); // Initalize the NotificationService
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isNotificationsEnabled') == null) {
      bool permissions = await requestPermissions();
      if (permissions) {
        await enableDailyNotifications();
        prefs.setBool("isNotificationsEnabled", true);
      } else {
        prefs.setBool("isNotificationsEnabled", false);
      }
    } else if (prefs.getBool('isNotificationsEnabled')!) {
      await enableDailyNotifications();
      log("Notifications were successfully enabled");
    } else {
      await NotificationService.disableDailyNotifications();
    }
  }

  static Future<void> scheduleNotification(
      int id, String title, String body, DateTime time) async {
    log("scheduleNotification called in NotificationService class");

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'azkar_channel',
      'Azkar Channel',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notiDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(time, tz.local),
      notiDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    log("Reached end of sheduleNotification in NotificationService class");
  }

  static Future<void> sendNotification(String title, String body) async {
    // Sends a notification with title and body
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'reminder_channel',
        'Reminder Channel',
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
    flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }

  static Future<void> scheduleAzkarDailyNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? dailyNotificationsEnabled =
        prefs.getBool("isNotificationsEnabled") ?? false;

    int? MORNING_HOUR = prefs.getInt('morning_hour') ?? 7;
    int? MORNING_MINUTE = prefs.getInt('morning_minute') ?? 30;
    int? NIGHT_HOUR = prefs.getInt('night_hour') ?? 17;
    int? NIGHT_MINUTE = prefs.getInt('night_minute') ?? 00;

    log("Call to scheduleDailyNotifications() was succefful.");
    if (!dailyNotificationsEnabled) {
      return;
    }

    final now = DateTime.now();
    final morningTime =
        DateTime(now.year, now.month, now.day, MORNING_HOUR, MORNING_MINUTE);
    final nightTime =
        DateTime(now.year, now.month, now.day, NIGHT_HOUR, NIGHT_MINUTE);

    await scheduleNotification(
        1,
        "حان وقت أذكار الصباح",
        "لا تنسي أذكار الصباح",
        morningTime.isBefore(now)
            ? morningTime.add(const Duration(days: 1))
            : morningTime);
    log("Schedeuled Morning Azkar on : ${morningTime.hour}:${morningTime.minute}",
        name: "NotificationService");

    await scheduleNotification(
        2,
        "حان وقت أذكار المساء",
        "لا تنسي أذكار المساء",
        nightTime.isBefore(now)
            ? nightTime.add(const Duration(days: 1))
            : nightTime);
    log("Schedeuled Night Azkar on : ${nightTime.hour}:${nightTime.minute}",
        name: "NotificationService");

    DateTime duaTime = DateTime(
      now.year,
      now.month,
      now.day,
      (MORNING_HOUR + NIGHT_HOUR) ~/ 2,
      (MORNING_MINUTE + NIGHT_MINUTE) ~/ 2,
    );
    String dua = dailyDuas[Random().nextInt(dailyDuas
        .length)]; // I personally think this shouldn't be updated with each time the notification is sent, but it does update-which is the desired behaviour- i don't know why though, but it works ig ¯\_(ツ)_/¯

    await scheduleNotification(3, "", dua, duaTime);
    log("Scheduled dua on ${duaTime.hour}:${duaTime.minute}",
        name: "NotificationService");

    prefs.setString("dailyDua",
        dua); // This is a future but i don't think i have to await it
    log("Updated dailyDua to $dua");
  }

  static Future<void> enableDailyNotifications() async {
    initServiceSettings();
    await scheduleAzkarDailyNotifications();
  }

  static Future<void> disableDailyNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<bool> requestPermissions() async {
    final PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      return true;
    }
    return false;
  }
}
