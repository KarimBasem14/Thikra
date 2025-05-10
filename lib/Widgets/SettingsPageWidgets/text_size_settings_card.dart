import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextSizeSettingsCard extends StatefulWidget {
  const TextSizeSettingsCard({super.key});

  @override
  State<TextSizeSettingsCard> createState() => _TextSizeSettingsCardState();
}

class _TextSizeSettingsCardState extends State<TextSizeSettingsCard> {
  double textSize = 20;
  static const String sampleText = "سبحان الله و بحمده سبحان الله العظيم";

  Future<void> _loadTextSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      textSize = prefs.getDouble("textSize") ?? 20;
    });
  }

  Future<void> updateTextSize(double size) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("textSize", size);
  }

  @override
  void initState() {
    _loadTextSize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Text(
                sampleText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: textSize),
              ),
            ),
          ),
          Slider(
            thumbColor: Theme.of(context).appBarTheme.backgroundColor,
            activeColor: Theme.of(context).appBarTheme.backgroundColor,
            min: 16,
            max: 35,
            value: textSize,
            divisions: 5,
            label: textSize.round().toString(),
            onChanged: (double value) async {
              setState(() {
                textSize = value;
              });
              updateTextSize(value);
            },
          )
        ],
      ),
    );
  }
}
