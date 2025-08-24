import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:muslim_azkar/DataSources/other_azkars_data.dart'
    show otherAzkarMap;
import 'package:muslim_azkar/Widgets/other_azkar_card.dart' show OtherAzkarCard;

import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

// ignore: must_be_immutable
class OtherAzkarScreen extends StatefulWidget {
  final String title;
  const OtherAzkarScreen({super.key, required this.title});

  @override
  State<OtherAzkarScreen> createState() => _OtherAzkarScreenState();
}

class _OtherAzkarScreenState extends State<OtherAzkarScreen> {
  double textSize = 20;
  List otherAzkarMapKeys = otherAzkarMap.keys.toList();
  int titleIndex = 0;

  Future<void> getTextSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    textSize = prefs.getDouble("textSize") ?? 20;
    setState(() {});
  }

  @override
  void initState() {
    getTextSize();
    titleIndex = otherAzkarMapKeys.indexOf(widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> azkar = otherAzkarMap[widget.title]["text"];
    if (widget.title == "المقدمة" || widget.title == "فضل الذكر") {
      String text = "";
      for (int i = 0; i < otherAzkarMap[widget.title]["text"].length; i++) {
        text += otherAzkarMap[widget.title]["text"][i];
        text += "\n";
      }
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              widget.title,
              style: GoogleFonts.kufam(),
              textAlign:
                  widget.title == "المقدمة" || widget.title == "فضل الذكر"
                      ? TextAlign.right
                      : TextAlign.center,
            ),
          ),
          body: SingleChildScrollView(
            child: Card(
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ));
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: azkar.length,
        itemBuilder: (ctx, i) {
          // ignore: non_constant_identifier_names
          // The problem is that I need to identify the name of the section and the index, that's why I have this ID variable here
          int ID = titleIndex * 1000 +
              i; // 1000 is just a random number to ensure for no collisions
          return OtherAzkarCard(
            zikr: azkar[i],
            fontSize: textSize,
            hiveName: "favouriteAzkarBox",
            id: ID,
          );
        },
      ),
    );
  }
}
