import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:muslim_azkar/DataSources/Quran_Dua.dart';
import 'package:muslim_azkar/DataSources/Sunnah_Dua.dart';
import 'package:share_plus/share_plus.dart';

class DuasScreen extends StatelessWidget {
  final String type;
  const DuasScreen({super.key, required this.type});

  static const TextStyle _textStyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    final String appBarTitle =
        type == 'Quran' ? "أدعية من القرآن" : "أدعية من السنة";
    final int listSize = type == 'Quran' ? QuranDua.length : SunnahDua.length;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: Text(
          appBarTitle,
          style: GoogleFonts.kufam(),
        ),
      ),
      body: ListView.builder(
          itemCount: listSize,
          itemBuilder: (ctx, i) {
            final String text =
                type == 'Quran' ? QuranDua[i]['text'] : SunnahDua[i]['text'];
            final String reference =
                type == 'Quran' ? QuranDua[i]['info'] : SunnahDua[i]['info'];
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
                        text,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: _textStyle,
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
                                  await Clipboard.setData(
                                      ClipboardData(text: text));
                                },
                                icon: const Icon(Icons.copy),
                              ),
                              IconButton(
                                onPressed: () {
                                  Share.share(text);
                                },
                                icon: const Icon(Icons.share),
                              ),
                            ],
                          ),
                          Text(
                            reference,
                            textDirection: TextDirection.rtl,
                            style: _textStyle,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
