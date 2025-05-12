import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_azkar/DataSources/Quran_Dua.dart';
import 'package:muslim_azkar/DataSources/Sunnah_Dua.dart';
import 'package:muslim_azkar/DataSources/hadiths.dart'
    show hadithsWithExplanation;
import 'package:muslim_azkar/DataSources/other_azkars_data.dart';
// import 'package:muslim_azkar/Widgets/favourite_hadith_card.dart'
// show FavouriteHadithCard;
import 'package:muslim_azkar/Widgets/other_azkar_card.dart';

class FavouritesScreen extends StatelessWidget {
  final String title;
  final String hiveName;
  const FavouritesScreen(
      {super.key, required this.title, required this.hiveName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          title,
        ),
      ),
      body: ValueListenableBuilder(
        // Listen to changes in the favoriteHadithBox using Hive.box().listenable()
        valueListenable: Hive.box(hiveName).listenable(),
        builder: (ctx, Box box, _) {
          return ListView.builder(
            itemCount: box.length, // The length of the box
            itemBuilder: (ctx, index) {
              // Get the index (ID) from the box
              int ID = box.getAt(index);
              String arabicText = "";
              // Get the Arabic text using the ID
              if (hiveName == "favouriteQuranDuasBox") {
                arabicText = QuranDua[ID]['text'];
              } else if (hiveName == "favoriteHadithBox") {
                arabicText = hadithsWithExplanation['hadith'][ID]['arabicText'];
              } else if (hiveName == "favouriteAzkarBox") {
                List otherAzkarMapKeys = otherAzkarMap.keys.toList();
                int titleIndex = ID ~/ 1000;
                String zikrTitle = otherAzkarMapKeys[titleIndex];
                int index = ID % 1000;
                arabicText = otherAzkarMap[zikrTitle]["text"][index];
              } else {
                arabicText = SunnahDua[ID]['text'];
              }

              return OtherAzkarCard(
                zikr: arabicText,
                fontSize: 20,
                hiveName: hiveName,
                id: ID,
              );
            },
          );
        },
      ),
    );
  }
}
