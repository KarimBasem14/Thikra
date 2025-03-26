import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:muslim_azkar/UtilityWidgets/about_card.dart';
import 'package:muslim_azkar/UtilityWidgets/azkar_notifications_settings.dart';
import 'package:muslim_azkar/UtilityWidgets/mazhar_settings_card.dart';

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
