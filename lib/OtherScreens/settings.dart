import 'package:flutter/material.dart';
import 'package:muslim_azkar/api/notificationapi.dart';

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

    await NotificationService.init(); // Initalize the NotificationService

    NotificationService.enableDailyNotifications(
        true); // Enables Notifications to be repeated on a daily basis
  }

  @override
  void initState() {
    super.initState();
    loadPreferences();
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
    setState(() {
      if (key == 'isNotificationsEnabled') {
        isNotificationsEnabled = value;
        if (value == false) {
          NotificationService.enableDailyNotifications(false);
          print("Notifications disabled");
        } else {
          enableNotifications();
          NotificationService.sendNotification('تم تشغيل الإشعارات', '');
          print("Notifications Enabled");
        }
      }

      if (key == 'isVibrationsEnabled') {
        isVibrationsEnabled = value;
        if (value == true) {
        } else if (value == false) {
        } else {}
      }
      ;
    });
  }

  TimeOfDay? morningTime = NotificationService.morningTime;
  TimeOfDay? nightTime = NotificationService.nightTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topRight,
          child: Text(
            "الإعدادات",
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
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
                              context: context, initialTime: morningTime!) ??
                          nightTime;
                      setState(() {});
                      print(nightTime);
                    },
                    child: ListTile(
                        trailing: const Text(" وقت أذكار المساء"),
                        leading: Text(
                            "${nightTime!.hour.toString().padLeft(2, '0')}:${nightTime!.minute.toString().padLeft(2, '0')}")),
                  ),
                  SwitchListTile(
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
