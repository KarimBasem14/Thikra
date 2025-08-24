import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:muslim_azkar/Screens/duas_screen.dart';

class DuaList extends StatelessWidget {
  const DuaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: Text(
          "الأدعية",
          style: GoogleFonts.kufam(),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const DuasScreen(type: 'Quran')));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(
                      "أدعية من القرآن",
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
                  builder: (ctx) => const DuasScreen(
                        type: 'hadith',
                      )));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(
                      "أدعية من السنة",
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
        ],
      ),
    );
  }
}
