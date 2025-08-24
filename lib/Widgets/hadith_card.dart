import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:muslim_azkar/Api/hive_box_definitions.dart' show favoriteHadithBox;
import 'package:muslim_azkar/DataSources/hadiths.dart'
    show hadithsWithExplanation;
import 'package:muslim_azkar/Screens/hadith_explanation.dart'
    show HadithExplanationPage;
import 'package:muslim_azkar/Widgets/UtilityWidgets/star_button.dart'
    show StarButton;
import 'package:share_plus/share_plus.dart';

class HadithCard extends StatefulWidget {
  const HadithCard({super.key});

  @override
  State<HadithCard> createState() => _HadithCardState();
}

class _HadithCardState extends State<HadithCard> {
  List<dynamic>? hadiths;
  int currentIndex = 0;
  String currentHadith = "";
  String sharh = "";

  @override
  void initState() {
    super.initState();
    currentIndex = Random().nextInt(hadithsWithExplanation["hadith"].length);
    currentHadith =
        hadithsWithExplanation["hadith"][currentIndex]["arabicText"];
    sharh = hadithsWithExplanation["hadith"][currentIndex]["arabicExplanation"];
    // loadDataOnStart();
  }

  // Future<void> loadDataOnStart() async {
  //   final String response = await rootBundle.loadString(
  //       r'D:\Code\Flutter\muslim_azkar\lib\data\riyad_alsalhin.json');
  //   final data = json.decode(response);
  //   setState(() {
  //     hadiths = data['hadiths'];
  //     updateHadith();
  //   });
  // }

  void updateHadith() {
    currentIndex = Random().nextInt(hadithsWithExplanation["hadith"].length);
    setState(() {
      currentHadith =
          hadithsWithExplanation["hadith"][currentIndex]["arabicText"];
    });
    sharh = hadithsWithExplanation["hadith"][currentIndex]["arabicExplanation"];
  }

  @override
  Widget build(BuildContext context) {
    return HadithCardWithDataRetrieved(
      hadith: currentHadith,
      index: currentIndex,
      sharh: sharh,
      loading: false,
      onPressFunction: updateHadith,
    );
  }
}

class HadithCardWithDataRetrieved extends StatefulWidget {
  const HadithCardWithDataRetrieved({
    super.key,
    required this.hadith,
    required this.index,
    required this.sharh,
    required this.loading,
    this.onPressFunction,
  });

  final String hadith;
  final String sharh;
  final int index;
  final VoidCallback? onPressFunction;
  final bool loading;

  @override
  State<HadithCardWithDataRetrieved> createState() =>
      _HadithCardWithDataRetrievedState();
}

class _HadithCardWithDataRetrievedState
    extends State<HadithCardWithDataRetrieved> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      await Share.share(widget.hadith);
                    },
                    icon: const Icon(
                      Icons.share,
                      size: 32,
                    )),
                Expanded(
                  child: Center(
                    child: Text(
                      "حديث اليوم",
                      style: Theme.of(context)
                          .appBarTheme
                          .titleTextStyle!
                          .copyWith(
                            fontSize: 35,
                          ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: widget.hadith));
                  },
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Center(
              child: widget.loading
                  ? const CircularProgressIndicator()
                  : Text(
                      widget.hadith,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .appBarTheme
                          .titleTextStyle!
                          .copyWith(
                            fontSize: 25,
                          ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: "عرض شرح الحديث",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => HadithExplanationPage(
                            pageTitle: "شرح الحديث", sharh: widget.sharh),
                      ),
                    );
                  },
                  icon: const Icon(Icons.info_outline_rounded),
                ),
                StarButton(hiveName: "favoriteHadithBox", index: widget.index),
                IconButton(
                  tooltip: "اختيار حديث اخر",
                  onPressed: widget.onPressFunction,
                  icon: const Icon(Icons.replay_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
