import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:share_plus/share_plus.dart' show Share;

class OtherAzkarCard extends StatelessWidget {
  final String zikr;
  final double fontSize;
  const OtherAzkarCard({super.key, required this.zikr, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                zikr,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await Clipboard.setData(ClipboardData(text: zikr));
                        },
                        icon: const Icon(Icons.copy),
                      ),
                      IconButton(
                        onPressed: () {
                          Share.share(zikr);
                        },
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),
                  Text(
                    "",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
