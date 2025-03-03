import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_azkar/MainScreens/homepage_utils/asma2_hosna.dart';
import 'package:muslim_azkar/MainScreens/homepage_utils/hadith_card.dart';
import 'package:muslim_azkar/MainScreens/homepage_utils/wrd_card.dart';
import 'package:muslim_azkar/OtherScreens/azkar_masa2.dart';
import 'package:muslim_azkar/OtherScreens/azkar_sabah.dart';
import 'package:muslim_azkar/OtherScreens/settings.dart';
import 'package:muslim_azkar/OtherScreens/tasbih.dart';
import 'package:flutter/material.dart';
import 'homepage_utils/top_main_card.dart';

List wrdCardPages = [
  AzkarMasa2(),
  AzkarSabah(),
  AzkarSabah(),
  const Tasbih(),
];

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final List<List> wrdCardsInfo = [
      [
        "ورد المساء",
        Icon(
          Icons.dark_mode_rounded,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        isDarkMode ? Colors.deepPurple : Colors.teal.shade400
      ],
      [
        "ورد الصباح",
        Icon(
          Icons.light_mode,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        isDarkMode ? Colors.orangeAccent : Colors.orange.shade200
      ],
      [
        "أذكار متنوعة",
        Icon(
          Icons.book,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        Colors.lightBlue
      ],
      [
        "تسبيح",
        ImageIcon(
          const AssetImage(
              r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\muslim-tasbih.png"),
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        isDarkMode ? Colors.blue.shade900 : Colors.blue.shade200
      ]
    ];
    bool isNight = true;
    // double width = MediaQuery.sizeOf(context).width;
    if (now.hour >= 4 && now.hour <= 16) {
      isNight = false;
    } else {
      isNight = true;
    }

    return Scaffold(
      // drawer: const MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "أذكار المسلم",
          style: GoogleFonts.kufam(),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: Builder(
          // Used for the drawer. To open the drawer you need to use a context under the context of the scaffold.
          builder: (ctx) => IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const Settings(),
                  ),
                );
                // Scaffold.of(ctx).openDrawer();
                // NotificationService.showInstantNotification(
                //    "karimmmmmm", "omarrrrr");
              },
              icon: const Icon(
                Icons.settings,
                color: Color.fromARGB(255, 39, 33, 33),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              TopMainCard(isNight: isNight),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,

                // color: Colors.red,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      4, // Adjust this based on the number of items you have
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 70,
                    crossAxisCount: 2,
                    childAspectRatio:
                        3.5, // Adjust this ratio to control height
                  ),
                  itemBuilder: (context, index) {
                    return WrdCard(
                      title: wrdCardsInfo[index][0],
                      color: wrdCardsInfo[index][2],
                      icon: wrdCardsInfo[index][1],
                      pageToGoTO: wrdCardPages[index],
                    );
                  },
                ),
              ),
              const HadithCard(),
              const Asma2Hosna(),
            ],
          ),
        ),
      ),
    );
  }
}
