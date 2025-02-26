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
  final List<List> wrdCardsInfo = [
    const [
      "ورد المساء",
      Icon(
        Icons.dark_mode_rounded,
        color: Colors.white,
      ),
      Colors.deepPurple
    ],
    const [
      "ورد الصباح",
      Icon(
        Icons.light_mode,
        color: Colors.white,
      ),
      Colors.orangeAccent
    ],
    const [
      "دروس متنوعة",
      Icon(
        Icons.book,
        color: Colors.white,
      ),
      Colors.lightBlue
    ],
    [
      "تسبيح",
      const ImageIcon(
        AssetImage(
            r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\muslim-tasbih.png"),
        color: Colors.white,
      ),
      Colors.blue.shade900
    ]
  ];

  @override
  Widget build(BuildContext context) {
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
                height: 125,

                // color: Colors.red,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      4, // Adjust this based on the number of items you have
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
