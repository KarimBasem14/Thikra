import 'package:muslim_azkar/UtilityWidgets/azkar_counter.dart'
    show AzkarCounter;
import 'package:muslim_azkar/data/azkar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

// ignore: must_be_immutable
class AzkarMasa2 extends StatefulWidget {
  const AzkarMasa2({super.key});

  @override
  State<AzkarMasa2> createState() => _AzkarMasa2State();
}

class _AzkarMasa2State extends State<AzkarMasa2> {
  final azkarMasa2ListKey = GlobalKey<AnimatedListState>();

  double textSize = 20;

  List<Zikr> _azkarmasa2 = [];

  Future<void> getTextSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    textSize = prefs.getDouble("textSize") ?? 20;
    setState(() {});
  }

  void removeitem(int index) {
    final removedItem = _azkarmasa2[index]; // Save the item being removed
    azkarMasa2ListKey.currentState!.removeItem(
      index,
      (context, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: const Offset(0, 0), // Slide to the left
          ).animate(animation),
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

    _azkarmasa2.removeAt(index);
  }

  @override
  void initState() {
    getTextSize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _azkarmasa2 = List<Zikr>.from(azkarmasa2);
    return Scaffold(
      appBar: AppBar(
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          title: const Align(
            alignment: Alignment.topRight,
            child: Text(
              "أذكار المساء",
            ),
          )),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: AnimatedList(
          key: azkarMasa2ListKey,
          initialItemCount: _azkarmasa2.length,
          itemBuilder: (ctx, i, animation) {
            return AzkarCounter(
              text: _azkarmasa2[i].text,
              count: _azkarmasa2[i].count,
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
