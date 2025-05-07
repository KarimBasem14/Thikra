import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:muslim_azkar/DataSources/azkar.dart' show Zikr, azkarsabah;
import 'package:muslim_azkar/Widgets/azkar_counter.dart' show AzkarCounter;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AzkarSabah extends StatefulWidget {
  const AzkarSabah({super.key});

  @override
  State<AzkarSabah> createState() => _AzkarSabahState();
}

class _AzkarSabahState extends State<AzkarSabah> {
  // List<Zikr> azkar_sabah= azkarsabah;
  final azkarSabahListKey = GlobalKey<AnimatedListState>();

  double textSize = 20;

  List<Zikr> _azkarsabah = [];

  Future<void> getTextSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    textSize = prefs.getDouble("textSize") ?? 20;
    setState(() {});
  }

  void removeitem(int index) {
    final removedItem = _azkarsabah[index]; // Save the item being removed
    azkarSabahListKey.currentState!.removeItem(
      index,
      (context, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: const Offset(0, 0), // Slide to the left
          ).animate(animation),
          // The problem I had is that I didn't know you need to specify the child
          child: AzkarCounter(
            text: removedItem.text,
            count: removedItem.count,
            textSize: textSize,
            removeItem: removeitem,
            index: index,
          ),
        );
      },
      duration: const Duration(milliseconds: 300), // Animation duration
    );

    // Remove the item from the list after the animation completes

    _azkarsabah.removeAt(index);
  }

  @override
  void initState() {
    getTextSize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("isNotificationsEnabled is ${}");
    _azkarsabah = List<Zikr>.from(
        azkarsabah); // Apparently saying that _azkarsabah = azakarsabah acts like a pointer to azkarsabah so an edit to _azkarsabah edits also azkarsabah! So this is how to actually copy the content of the original list
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: Text(
          "أذكارُ الصباحِ",
          style: GoogleFonts.kufam(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: AnimatedList(
          key: azkarSabahListKey,
          initialItemCount: _azkarsabah.length,
          itemBuilder: (ctx, i, animation) {
            return AzkarCounter(
              text: _azkarsabah[i].text,
              count: _azkarsabah[i].count,
              textSize: textSize,
              removeItem: removeitem,
              index: i,
            );
          },
        ),
      ),
    );
  }
}
