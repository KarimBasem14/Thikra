import 'package:flutter/material.dart';
import 'package:muslim_azkar/Screens/azkar_masa2.dart' show AzkarMasa2;
import 'package:muslim_azkar/Screens/azkar_sabah.dart' show AzkarSabah;
import 'package:muslim_azkar/Screens/other_azkar_listview.dart' show OtherAzkar;
import 'package:muslim_azkar/Screens/tasbih.dart' show Tasbih;
import 'package:muslim_azkar/Widgets/asma2_hosna.dart' show Asma2Hosna;
import 'package:muslim_azkar/Widgets/dua_card_main_screen.dart';
import 'package:muslim_azkar/Widgets/hadith_card.dart' show HadithCard;
import 'package:muslim_azkar/Widgets/sliver_app_bar.dart' show MainSliverAppBar;
import 'package:muslim_azkar/Widgets/top_main_card.dart' show TopMainCard;
import 'package:muslim_azkar/Widgets/wrd_card.dart' show WrdCard;

class HomepageWithSliverAppBar extends StatelessWidget {
  HomepageWithSliverAppBar({super.key});
  final DateTime now = DateTime.now();
  final List wrdCardPages = [
    const AzkarMasa2(),
    const AzkarSabah(),
    OtherAzkar(),
    const Tasbih(),
  ];
  @override
  Widget build(BuildContext context) {
    bool isNight = now.hour < 4 || now.hour > 16;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<List> wrdCardsInfo = [
      [
        "ورد المساء",
        Icon(Icons.dark_mode_rounded,
            color: isDarkMode ? Colors.white : Colors.black),
        isDarkMode ? const Color(0xFF3F51B5) : Colors.orangeAccent.shade100
      ],
      [
        "ورد الصباح",
        Icon(Icons.light_mode, color: isDarkMode ? Colors.white : Colors.black),
        isDarkMode ? Colors.orangeAccent : Colors.amber.shade100,
      ],
      [
        "أذكار متنوعة",
        Icon(Icons.book, color: isDarkMode ? Colors.white : Colors.black),
        isDarkMode ? const Color(0xFF5DADE2) : Colors.cyan.shade100,
      ],
      [
        "تسبيح",
        ImageIcon(
            const AssetImage(
                r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\muslim-tasbih.png"),
            color: isDarkMode ? Colors.white : Colors.black),
        isDarkMode ? Colors.blue.shade900 : Colors.blue.shade100,
      ]
    ];

    return Scaffold(
      // appBar: mainAppBar(context),
      // backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          const MainSliverAppBar(),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TopMainCard(isNight: isNight),

                  // const HadithCard(),
                  // const Asma2Hosna(),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: DuaCard(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return WrdCard(
                    title: wrdCardsInfo[index][0],
                    color: wrdCardsInfo[index][2],
                    icon: wrdCardsInfo[index][1],
                    pageToGoTo: wrdCardPages[index],
                  );
                },
                childCount: 4,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 70,
                crossAxisCount: 2,
                childAspectRatio: 3.5,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  HadithCard(),
                  Asma2Hosna(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
