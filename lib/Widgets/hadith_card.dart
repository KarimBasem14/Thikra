import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_azkar/Api/favoriteHadithBox.dart' show favoriteHadithBox;
import 'package:muslim_azkar/DataSources/hadiths.dart'
    show hadithsWithExplanation;
import 'package:muslim_azkar/Screens/hadith_explanation.dart'
    show HadithExplanationPage;
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0 +
                            35.0), // adding 35 to account for the font size, and adding 32 to account for the space that the icon takes, padding just shifts the widget in this case to the right
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
                StarButton(index: widget.index)
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
                        builder: (ctx) =>
                            HadithExplanationPage(sharh: widget.sharh),
                      ),
                    );
                  },
                  icon: const Icon(Icons.info_outline_rounded),
                ),
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

void addToFavourite(int index) {
  int ID = index; // The hadith's ID in the box is its index from the map
  favoriteHadithBox.put(ID, ID);
}

bool isFavourite(int index) {
  // Checks if a hadith is favorited or not.
  int ID = index; // The hadith's ID in the box is its index from the map
  return favoriteHadithBox.containsKey(ID);
}

void removeFavourite(int index) {
  int ID = index;
  favoriteHadithBox.delete(ID);
}

class StarButton extends StatefulWidget {
  final int index;
  const StarButton({super.key, required this.index});

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      // Listen to changes in the favoriteHadithBox using Hive.box().listenable()
      valueListenable: Hive.box('favoriteHadithBox').listenable(),
      builder: (ctx, Box box, _) {
        bool isFavorite = isFavourite(widget.index);
        return IconButton(
            onPressed: () {
              if (isFavorite) {
                removeFavourite(widget.index);
              } else {
                addToFavourite(widget.index);
              }

              setState(() {});
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_outline,
                size: 32,
                key: ValueKey<bool>(isFavorite), // Very important
              ),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: animation,
                child: child,
              ),
            ));
      },
    );
  }
}
