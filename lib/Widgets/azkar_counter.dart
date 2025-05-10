import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AzkarCounter extends StatefulWidget {
  final String text;
  final Function? removeItem;
  double? textSize;
  int count;
  final int? index;
  final String? footnote;
  AzkarCounter({
    super.key,
    required this.text,
    required this.count,
    this.textSize, // Default value 20
    this.removeItem,
    this.index,
    this.footnote,
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
    //it slides to the right or left if _counter reaches 0
    if (widget.count == 0 && widget.removeItem != null) {
      setState(() {
        widget.removeItem!(widget.index!);
        // print("Item ${widget.index} removed");
      });
    }
  }

  double tileHeight = 35;
  // double tileHeight = 220;
  @override
  Widget build(BuildContext context) {
    if (widget.textSize == null) {
      widget.textSize = 20;
    }
    final double tileWidth = MediaQuery.of(context).size.width;
    // final double tileHeight = MediaQuery.of(context).size.height;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color tileColor = Theme.of(context).cardColor;
    // print(tileHeight);
    return Stack(clipBehavior: Clip.hardEdge, children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
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
                      const EdgeInsets.all(40), // Between text and card border
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          widget.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: widget.textSize,
                              color: isDarkMode ? Colors.white : Colors.black),
                        ),
                        if (widget.footnote != null) ...[
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "footnote",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ),
                        ]
                      ],
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
              height: tileHeight,
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
