import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AzkarCounter extends StatefulWidget {
  final String text;
  final Function? removeItem;
  int count;
  final int? index;
  AzkarCounter({
    super.key,
    required this.text,
    required this.count,
    Function? this.removeItem,
    int? this.index,
  });
  @override
  State<AzkarCounter> createState() => _AzkarCounterState();
}

class _AzkarCounterState extends State<AzkarCounter> {
  // int _counter = 3;
  void decrementCounter() {
    if (widget.count != 0) {
      HapticFeedback.vibrate();
      SystemSound.play(SystemSoundType.click);
      setState(() {
        widget.count--;
      });
    }
    // Want to add that it slides to the right or left if _counter reaches 0
    if (widget.count == 0) {
      setState(() {
        widget.removeItem!(widget.index!);
        print("Item ${widget.index} removed");
      });
    }
  }

  double textSize = 25;
  // double tileHeight = 220;
  @override
  Widget build(BuildContext context) {
    final double tileWidth = MediaQuery.of(context).size.width;
    // final double tileHeight = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    final Color tileColor = Theme.of(context).cardColor;
    // print(tileHeight);
    return Stack(clipBehavior: Clip.hardEdge, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: decrementCounter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                minHeight:
                    120), // Used to make the card expand according to the text, 120 height is approximately needed for the card with the least text, if the card needs more space it simply expands beyond that
            child: Card(
                color: tileColor,
                child: Padding(
                  padding:
                      const EdgeInsets.all(30), // Between text and card border
                  child: Center(
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: textSize),
                    ),
                  ),
                )),
          ),
        ),
      ),
      Positioned.fill(
        // top: 100,
        // right: 20,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            color: isDarkMode ? Colors.black : Colors.brown.shade300,
            child: SizedBox(
              width: tileWidth / 1.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await Share.share(widget.text);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "مشاركة",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  const Text("|", style: TextStyle(fontSize: 25)),
                  Row(
                    children: [
                      Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDarkMode ? Colors.white : Colors.black,
                              // width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.count.toString(),
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "التكرار",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
