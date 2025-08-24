import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:muslim_azkar/Widgets/UtilityWidgets/star_button.dart'
    show StarButton;
import 'package:share_plus/share_plus.dart' show Share;

class OtherAzkarCard extends StatelessWidget {
  final String zikr;
  final double fontSize;
  final String? reference;
  final String? hiveName;
  final int? id;
  const OtherAzkarCard(
      {super.key,
      required this.zikr,
      required this.fontSize,
      this.reference,
      this.hiveName,
      this.id});

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
                      // IconButton(
                      //   onPressed: () {
                      //     Share.share(zikr);
                      //   },
                      //   icon: const Icon(Icons.star_border_outlined),
                      // ),
                      if (hiveName != null && id != null)
                        StarButton(hiveName: hiveName!, index: id!)
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
                  Text(
                    reference ?? "",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
