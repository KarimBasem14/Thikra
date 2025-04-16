import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_azkar/MainScreens/homepage_utils/favourite_hadith_card.dart';
import 'package:muslim_azkar/data/hadiths.dart';

class FavoriteHadithsPage extends StatelessWidget {
  const FavoriteHadithsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "الأحاديث المفضلة",
        ),
      ),
      body: ValueListenableBuilder(
        // Listen to changes in the favoriteHadithBox using Hive.box().listenable()
        valueListenable: Hive.box('favoriteHadithBox').listenable(),
        builder: (ctx, Box box, _) {
          return ListView.builder(
            itemCount: box.length, // The length of the favoriteHadithBox
            itemBuilder: (ctx, index) {
              // Get the index (ID) from the favoriteHadithBox
              int ID = box.getAt(index);

              // Get the Arabic text of the Hadith using the ID
              String arabicText =
                  hadithsWithExplanation["hadith"][ID]["arabicText"];

              return FavouriteHadithCard(hadith: arabicText, id: ID);
            },
          );
        },
      ),
    );
  }
}
