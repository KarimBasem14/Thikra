// ignore_for_file:  constant_identifier_names, non_constant_identifier_names

import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService2 {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static bool dailyNotificationsEnabled = true;

  // File ignores name not being lowercase camel

  static int MORNING_HOUR = 7; // 7:30 AM
  static int MORNING_MINUTE = 30;
  static int NIGHT_HOUR = 17; // 5:00 PM
  static int NIGHT_MINUTE = 00;

  static Future<TimeOfDay> get morningTime async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    MORNING_HOUR = prefs.getInt('morning_hour') ?? 7;
    MORNING_MINUTE = prefs.getInt('morning_minute') ?? 30;
    return TimeOfDay(hour: MORNING_HOUR, minute: MORNING_MINUTE);
  }

  static Future<TimeOfDay> get nightTime async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    NIGHT_HOUR = prefs.getInt('night_hour') ?? 17;
    NIGHT_MINUTE = prefs.getInt('night_minute') ?? 00;
    return TimeOfDay(hour: NIGHT_HOUR, minute: NIGHT_MINUTE);
  }

  static void updateMorningTime(TimeOfDay morningTime) {}

  static Future<void> onDidReceiveNotification(
      NotificationResponse notificationResponse) async {
    log("Notification received: ${notificationResponse.payload}");
  }

  static Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true);

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    final bool? initialized = await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
    );

    log("Notifications Initialized: $initialized");

    // Request permission for iOS
    // if (initialized != null && initialized) {
    //   await flutterLocalNotificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           DarwinFlutterLocalNotificationsPlugin>()
    //       ?.requestPermissions(
    //         alert: true,
    //         badge: true,
    //         sound: true,
    //       );
    // }
  }

  static Future<void> sendNotification(String title, String body) async {
    const NotificationDetails notification_details = NotificationDetails(
      android: AndroidNotificationDetails(
        'reminder_channel',
        'Reminder Channel',
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
    flutterLocalNotificationsPlugin.show(0, title, body, notification_details);
  }

  static Future<void> scheduleNotification(
      int id, String title, String body, DateTime scheduledTime) async {
    log("Call to sheduleNotification was successful");
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'reminder_channel',
          'Reminder Channel',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    log("Reached end of sheduleNotification");
  }

  static Future<void> scheduleDailyNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    MORNING_HOUR = prefs.getInt('morning_hour') ?? 7;
    MORNING_MINUTE = prefs.getInt('morning_minute') ?? 30;
    NIGHT_HOUR = prefs.getInt('night_hour') ?? 17;
    NIGHT_MINUTE = prefs.getInt('night_minute') ?? 00;

    log("Call to scheduleDailyNotifications() was succefful.");
    if (!dailyNotificationsEnabled) {
      return;
    }

    final now = DateTime.now();
    final morningTime =
        DateTime(now.year, now.month, now.day, MORNING_HOUR, MORNING_MINUTE);
    final nightTime =
        DateTime(now.year, now.month, now.day, NIGHT_HOUR, NIGHT_MINUTE);
    log("Morning time is $morningTime");
    log("Night time is $nightTime");
    log("Now calling sheduleNotification on morning and night time");
    await scheduleNotification(
        1,
        "حان وقت أذكار الصباح",
        "لا تنسي أذكار الصباح",
        morningTime.isBefore(now)
            ? morningTime.add(const Duration(days: 1))
            : morningTime);

    await scheduleNotification(
        2,
        "حان وقت أذكار المساء",
        "لا تنسي أذكار المساء",
        nightTime.isBefore(now)
            ? nightTime.add(const Duration(days: 1))
            : nightTime);
  }

  static Future<void> enableDailyNotifications(bool enable) async {
    dailyNotificationsEnabled = enable;
    log("enableDailyNotifications was called with dailyNotificationsEnabled set to $dailyNotificationsEnabled");
    if (enable) {
      log("Now calling scheduleDailyNotifications()");
      await scheduleDailyNotifications();
    } else {
      await flutterLocalNotificationsPlugin.cancelAll();
    }
  }
}
