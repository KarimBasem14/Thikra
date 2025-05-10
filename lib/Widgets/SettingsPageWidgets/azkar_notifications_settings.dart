import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:muslim_azkar/Api/notificationapi.dart' show NotificationService;

import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class AzkarNotificationsSettingsCard extends StatefulWidget {
  const AzkarNotificationsSettingsCard({super.key});

  @override
  State<AzkarNotificationsSettingsCard> createState() =>
      _AzkarNotificationsSettingsCardState();
}

class _AzkarNotificationsSettingsCardState
    extends State<AzkarNotificationsSettingsCard> {
  late SharedPreferences prefs;
  bool isNotificationsEnabled = false;

  bool getNotificationBool() {
    return isNotificationsEnabled;
  }

  @override
  void initState() {
    super.initState();
    loadPreferences();
    getAzkarTime();
  }

  Future<void> loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isNotificationsEnabled = prefs.getBool('isNotificationsEnabled') ?? false;
    });
  }

  Future<void> updatePreference(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);

    if (key == 'isNotificationsEnabled') {
      isNotificationsEnabled = value;
      if (value == false) {
        NotificationService.disableDailyNotifications();
        log("Notifications disabled", name: "Settings Page");
      } else {
        bool permissions = await NotificationService.requestPermissions();
        log(
            permissions
                ? "Notification permissions granted"
                : "Notification permissions not granted",
            name: "Settings Page");
        if (permissions) {
          await NotificationService.enableDailyNotifications();
          NotificationService.sendNotification('تم تشغيل الإشعارات', '');
          log("Notifications Enabled", name: "Settings Page");
        }
      }
    }

    setState(() {});
  }

  TimeOfDay? morningTime = const TimeOfDay(hour: 7, minute: 30);
  TimeOfDay? nightTime = const TimeOfDay(hour: 17, minute: 00);

  Future<void> getAzkarTime() async {
    morningTime = await NotificationService.morningTime;
    nightTime = await NotificationService.nightTime;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SwitchListTile(
            activeTrackColor: Theme.of(context).appBarTheme.backgroundColor,
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text(
              "اشعارات الأذكار",
              textAlign: TextAlign.right,
            ),
            value: isNotificationsEnabled,
            onChanged: (val) => updatePreference('isNotificationsEnabled', val),
          ),
          GestureDetector(
            onTap: () async {
              morningTime = await showTimePicker(
                      context: context, initialTime: morningTime!) ??
                  morningTime;
              setState(() {});

              if (morningTime != null) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setInt('morning_hour', morningTime!.hour);
                prefs.setInt('morning_minute', morningTime!.minute);
              }
              await NotificationService.enableDailyNotifications();
              print(morningTime);
            },
            child: ListTile(
                trailing: const Text(
                  " وقت أذكار الصباح",
                  style: TextStyle(fontSize: 15),
                ),
                leading: Text(
                    "${morningTime!.hour.toString().padLeft(2, '0')}:${morningTime!.minute.toString().padLeft(2, '0')}")),
          ),
          GestureDetector(
            onTap: () async {
              nightTime = await showTimePicker(
                      context: context, initialTime: nightTime!) ??
                  nightTime;
              setState(() {});

              if (nightTime != null) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setInt('night_hour', nightTime!.hour);
                prefs.setInt('night_minute', nightTime!.minute);
              }
              await NotificationService.enableDailyNotifications();
              print(nightTime);
            },
            child: ListTile(
                trailing: const Text(
                  " وقت أذكار المساء",
                  style: TextStyle(fontSize: 15),
                ),
                leading: Text(
                    "${nightTime!.hour.toString().padLeft(2, '0')}:${nightTime!.minute.toString().padLeft(2, '0')}")),
          ),
        ],
      ),
    );
  }
}
