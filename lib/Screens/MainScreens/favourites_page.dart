import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:muslim_azkar/Screens/favorite_hadiths_page.dart';
import 'package:muslim_azkar/Screens/favourite_duas_page.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "المُفضلة",
          style: GoogleFonts.kufam(),
        ),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const FavouritesScreen(
                        title: "مُفضلة الدعاء من القرآن الكريم",
                        hiveName: "favouriteQuranDuasBox",
                      )));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(
                      "مُفضلة الدعاء من القرآن الكريم",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    leading: Image(
                      // size: 50,
                      image: AssetImage(
                          r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\Quran.png"),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const FavouritesScreen(
                        title: "مُفضلة الدعاء من السُنة",
                        hiveName: "favouriteSunnahDuasBox",
                      )));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(
                      "مُفضلة الدعاء من السُنة",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    leading: Image(
                      // size: 50,
                      image: AssetImage(
                          r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\Prophet.png"),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const FavouritesScreen(
                        title: "مُفضلة الأحاديث",
                        hiveName: "favoriteHadithBox",
                      )));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(
                      "مُفضلة الأحاديث",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    leading: Image(
                      // size: 50,
                      image: AssetImage(
                          r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\Hadith.png"),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
