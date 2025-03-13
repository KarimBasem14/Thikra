import 'package:flutter/material.dart';
import 'package:muslim_azkar/UtilityWidgets/azkar_notifications_settings.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
          children: const [
            Align(
              alignment: Alignment.center,
              child: Text(
                "أذكار الصباح و المساء",
                style: TextStyle(fontSize: 20),
              ),
            ),
            AzkarNotificationsSettingsCard(),
          ],
        ),
      ),
    );
  }
}
