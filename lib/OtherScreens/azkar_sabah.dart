import 'package:muslim_azkar/utilityWidgets/azkar_counter.dart';
import 'package:muslim_azkar/data/azkar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AzkarSabah extends StatelessWidget {
  AzkarSabah({super.key});

  // List<Zikr> azkar_sabah= azkarsabah;
  final azkarSabahListKey = GlobalKey<AnimatedListState>();

  List<Zikr> _azkarsabah = [];

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
  Widget build(BuildContext context) {
    // print("isNotificationsEnabled is ${}");
    _azkarsabah = List<Zikr>.from(
        azkarsabah); // Apparently saying that _azkarsabah = azakarsabah acts like a pointer to azkarsabah so an edit to _azkarsabah edits also azkarsabah! So this is how to actually copy the content of the original list
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: const Align(
          alignment: Alignment.topRight,
          child: Text(
            "أذكار الصباح",
          ),
        ),
      ),
      body: AnimatedList(
        key: azkarSabahListKey,
        initialItemCount: _azkarsabah.length,
        itemBuilder: (ctx, i, animation) {
          return AzkarCounter(
            text: _azkarsabah[i].text,
            count: _azkarsabah[i].count,
            removeItem: removeitem,
            index: i,
          );
        },
      ),
    );
  }
}
