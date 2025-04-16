import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:muslim_azkar/UtilityWidgets/azkar_counter.dart';
import 'package:muslim_azkar/data/other_azkars_title.dart';

// ignore: must_be_immutable
class OtherAzkarScreen extends StatelessWidget {
  final String title;
  OtherAzkarScreen({super.key, required this.title});

  final azkarKey = GlobalKey<AnimatedListState>();
  final double textSize = 20;
  List azkar = [];

  void removeitem(int index) {
    final removedItem = azkar[index]; // Save the item being removed
    azkarKey.currentState!.removeItem(
      index,
      (context, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: const Offset(0, 0), // Slide to the left
          ).animate(animation),
          // The problem I had is that I didn't know you need to specify the child
          child: AzkarCounter(
            text: removedItem,
            count: 1,
            textSize: textSize,
            removeItem: removeitem,
            index: index,
          ),
        );
      },
      duration: const Duration(milliseconds: 300), // Animation duration
    );

    // Remove the item from the list after the animation completes

    azkar.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    azkar = otherAzkarMap[title]["text"];

    if (title == "المقدمة" || title == "فضل الذكر") {
      String text = "";
      for (int i = 0; i < otherAzkarMap[title]["text"].length; i++) {
        text += otherAzkarMap[title]["text"][i];
        text += "\n";
      }
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              title,
              style: GoogleFonts.kufam(),
              textAlign: title == "المقدمة" || title == "فضل الذكر"
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
        title: Text(title),
      ),
      body: AnimatedList(
        key: azkarKey,
        initialItemCount: azkar.length,
        itemBuilder: (ctx, i, animation) {
          return AzkarCounter(
            text: azkar[i],
            count: 1,
            textSize: textSize,
            removeItem: removeitem,
            index: i,
          );
        },
      ),
    );
  }
}
