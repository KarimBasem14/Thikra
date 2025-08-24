import 'package:flutter/material.dart';
import 'package:muslim_azkar/DataSources/duas.dart' show dailyDuas;
import 'package:shared_preferences/shared_preferences.dart';

// Made this into a seperate widget so I can keep the app bar a stateless widget
//
class DuaTextInAppBar extends StatefulWidget {
  const DuaTextInAppBar({super.key});

  @override
  State<DuaTextInAppBar> createState() => _DuaTextInAppBarState();
}

class _DuaTextInAppBarState extends State<DuaTextInAppBar> {
  double _opacity = 0.0;
  String duaText = "";
  void _loadDuaText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    duaText = prefs.getString("dailyDua") ?? dailyDuas[4];
  }

  @override
  void initState() {
    _loadDuaText();
    Future.delayed(const Duration(milliseconds: 500), () {
      // Beside the cool animation this time also helps with loading the duaText
      setState(() {
        _opacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 2),
      opacity: _opacity,
      child: Text(
        duaText,
        textAlign: TextAlign.center,
        style: Theme.of(context).appBarTheme.toolbarTextStyle,
      ),
    );
  }
}
