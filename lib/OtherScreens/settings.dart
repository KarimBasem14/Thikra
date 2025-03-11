import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:muslim_azkar/api/notificationapiv2.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late SharedPreferences prefs;
  bool isNotificationsEnabled = false;
  bool isVibrationsEnabled = false;

  bool getNotificationBool() {
    return isNotificationsEnabled;
  }

  void enableNotifications() async {
    // Initialize time zone datas
    tz.initializeTimeZones(); // This is a very important line, without it the NotificationService's sheduleNotification method raises a late initialization error

    await NotificationService
        .initServiceSettings(); // Initalize the NotificationService

    NotificationService
        .enableDailyNotifications(); // Enables Notifications to be repeated on a daily basis
  }

  @override
  void initState() {
    super.initState();
    loadPreferences();
    updateTime();
  }

  Future<void> loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isNotificationsEnabled = prefs.getBool('isNotificationsEnabled') ?? false;
      isVibrationsEnabled = prefs.getBool('isVibrationsEnabled') ?? false;
    });
  }

  Future<void> updatePreference(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);

    if (key == 'isNotificationsEnabled') {
      isNotificationsEnabled = value;
      if (value == false) {
        NotificationService.disableDailyNotifications();
        log("Notifications disabled");
      } else {
        bool permissions = await NotificationService.requestPermissions();
        log(
            permissions
                ? "Notification permissions granted"
                : "Notification permissions not granted",
            name: "Settings Page");
        if (permissions) {
          enableNotifications();
          NotificationService.sendNotification('تم تشغيل الإشعارات', '');
          log("Notifications Enabled", name: "Settings Page");
        }
      }
    }

    setState(() {
      if (key == 'isVibrationsEnabled') {
        isVibrationsEnabled = value;
        if (value == true) {
        } else if (value == false) {
        } else {}
      }
    });
  }

  TimeOfDay? morningTime = const TimeOfDay(hour: 7, minute: 30);
  TimeOfDay? nightTime = const TimeOfDay(hour: 17, minute: 00);

  Future<void> updateTime() async {
    morningTime = await NotificationService.morningTime;
    nightTime = await NotificationService.nightTime;
  }

  @override
  Widget build(BuildContext context) {
    // log("Morning time is $morningTime");
    // log("Night time is $nightTime");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "الإعدادات",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "أذكار الصباح و المساء",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    activeTrackColor:
                        Theme.of(context).appBarTheme.backgroundColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      "تفعيل التنبيهات",
                      textAlign: TextAlign.right,
                    ),
                    value: isNotificationsEnabled,
                    onChanged: (val) =>
                        updatePreference('isNotificationsEnabled', val),
                  ),
                  GestureDetector(
                    onTap: () async {
                      morningTime = await showTimePicker(
                              context: context, initialTime: morningTime!) ??
                          morningTime;
                      setState(() {});
                      enableNotifications();
                      if (morningTime != null) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setInt('morning_hour', morningTime!.hour);
                        prefs.setInt('morning_minute', morningTime!.minute);
                      }
                      print(morningTime);
                    },
                    child: ListTile(
                        trailing: const Text(" وقت أذكار الصباح"),
                        leading: Text(
                            "${morningTime!.hour.toString().padLeft(2, '0')}:${morningTime!.minute.toString().padLeft(2, '0')}")),
                  ),
                  GestureDetector(
                    onTap: () async {
                      nightTime = await showTimePicker(
                              context: context, initialTime: nightTime!) ??
                          nightTime;
                      setState(() {});
                      enableNotifications();
                      if (nightTime != null) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setInt('night_hour', nightTime!.hour);
                        prefs.setInt('night_minute', nightTime!.minute);
                      }
                      print(nightTime);
                    },
                    child: ListTile(
                        trailing: const Text(" وقت أذكار المساء"),
                        leading: Text(
                            "${nightTime!.hour.toString().padLeft(2, '0')}:${nightTime!.minute.toString().padLeft(2, '0')}")),
                  ),
                  SwitchListTile(
                    activeTrackColor:
                        Theme.of(context).appBarTheme.backgroundColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      "تفعيل الأهتزاز عند القراءة",
                      textAlign: TextAlign.right,
                    ),
                    value: isVibrationsEnabled,
                    onChanged: (val) =>
                        updatePreference('isVibrationsEnabled', val),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
