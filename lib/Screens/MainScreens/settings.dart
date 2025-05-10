import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:muslim_azkar/Widgets/SettingsPageWidgets/about_settings_card.dart'
    show AboutCard;
import 'package:muslim_azkar/Widgets/SettingsPageWidgets/azkar_notifications_settings.dart'
    show AzkarNotificationsSettingsCard;
import 'package:muslim_azkar/Widgets/SettingsPageWidgets/mazhar_settings_card.dart'
    show MazharSettingsCard;
import 'package:muslim_azkar/Widgets/SettingsPageWidgets/text_size_settings_card.dart'
    show TextSizeSettingsCard;

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    // log("Morning time is $morningTime");
    // log("Night time is $nightTime");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "الإعدادات",
          style: GoogleFonts.kufam(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10, bottom: 10, top: 5),
              child: const Text(
                "الخط",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const TextSizeSettingsCard(),
            Container(
              margin: const EdgeInsets.only(right: 10, bottom: 10, top: 5),
              child: const Text(
                "أذكار الصباح و المساء",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const AzkarNotificationsSettingsCard(),
            Container(
              margin: const EdgeInsets.only(right: 10, bottom: 10, top: 5),
              child: const Text(
                "المظهر",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const MazharSettingsCard(),
            Container(
              margin: const EdgeInsets.only(right: 10, bottom: 10, top: 5),
              child: const Text(
                "عن التطبيق",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const AboutCard(),
          ],
        ),
      ),
    );
  }
}
