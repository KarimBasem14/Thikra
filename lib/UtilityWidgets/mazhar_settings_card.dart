import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart'
    show AdaptiveTheme, AdaptiveThemeMode;
import 'package:flutter/material.dart';
import 'package:muslim_azkar/theme/theme.dart';

class MazharSettingsCard extends StatefulWidget {
  const MazharSettingsCard({super.key});

  @override
  State<MazharSettingsCard> createState() => _MazharSettingsCardState();
}

class _MazharSettingsCardState extends State<MazharSettingsCard> {
  AdaptiveThemeMode? savedTheme;
  int current_option =
      0; // 0 -> device default, 1 -> light mode, 2 -> dark mode
  void getSavedTheme() async {
    savedTheme = await AdaptiveTheme.getThemeMode();
    if (savedTheme == AdaptiveThemeMode.system) {
      current_option = 0;
    } else if (savedTheme == AdaptiveThemeMode.light) {
      current_option = 1;
    } else if (savedTheme == AdaptiveThemeMode.dark) {
      current_option = 2;
    }
    setState(() {});
  }

  @override
  void initState() {
    getSavedTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          RadioListTile(
              title: const Text(
                "وضع النظام",
                textAlign: TextAlign.right,
              ),
              value: 0,
              secondary: const Icon(Icons.mobile_friendly),
              groupValue: current_option,
              onChanged: (val) {
                setState(() {
                  current_option = val!;
                });
                AdaptiveTheme.of(context).setSystem();
                log("Changed to system default theme", name: "Settings Page");
                log("${Theme.of(context).brightness}");
              }),
          RadioListTile(
              title: const Text(
                "الوضع النهارى",
                textAlign: TextAlign.right,
              ),
              secondary: const Icon(Icons.sunny),
              value: 1,
              groupValue: current_option,
              onChanged: (val) {
                setState(() {
                  current_option = val!;
                });
                AdaptiveTheme.of(context).setLight();
                log("Changed to light theme", name: "Settings Page");
                log("${Theme.of(context).brightness}");
                Future.delayed(Duration(seconds: 5)).then((k) {
                  log("${Theme.of(context).brightness}");
                });
              }),
          RadioListTile(
              title: const Text(
                "الوضع الليلى",
                textAlign: TextAlign.right,
              ),
              secondary: const Icon(Icons.dark_mode_rounded),
              value: 2,
              groupValue: current_option,
              onChanged: (val) {
                setState(() {
                  current_option = val!;
                });
                AdaptiveTheme.of(context).setDark();
                log("Changed to dark theme", name: "Settings Page");
                Future.delayed(Duration(seconds: 5)).then((k) {
                  log("${Theme.of(context).brightness}");
                });
              })
        ],
      ),
    );
  }
}
