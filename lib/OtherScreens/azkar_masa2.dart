import 'package:muslim_azkar/utilityWidgets/azkar_counter.dart';
import 'package:muslim_azkar/data/azkar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AzkarMasa2 extends StatelessWidget {
  AzkarMasa2({super.key});
  final azkarMasa2ListKey = GlobalKey<AnimatedListState>();
  List<Zikr> _azkarmasa2 = [];
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
              removeItem: removeitem,
              index: i,
            );
          },
        ),
      ),
    );
  }
}
