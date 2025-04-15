import 'package:flutter/material.dart';
import 'package:muslim_azkar/MainScreens/homepage_utils/asma2_hosna.dart';
import 'package:muslim_azkar/MainScreens/homepage_utils/hadith_card.dart';
import 'package:muslim_azkar/MainScreens/homepage_utils/top_main_card.dart'
    show TopMainCard;
import 'package:muslim_azkar/MainScreens/homepage_utils/wrd_card.dart'
    show WrdCard;
import 'package:muslim_azkar/MainScreens/main_sliver_app_bar.dart'
    show MainSliverAppBar;
import 'package:muslim_azkar/OtherScreens/azkar_masa2.dart' show AzkarMasa2;
import 'package:muslim_azkar/OtherScreens/azkar_sabah.dart' show AzkarSabah;
import 'package:muslim_azkar/OtherScreens/other_azkar.dart' show OtherAzkar;
import 'package:muslim_azkar/OtherScreens/tasbih.dart' show Tasbih;

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
        Color(0xFF3F51B5)
      ],
      [
        "ورد الصباح",
        Icon(Icons.light_mode, color: isDarkMode ? Colors.white : Colors.black),
        Colors.orangeAccent,
      ],
      [
        "أذكار متنوعة",
        Icon(Icons.book, color: isDarkMode ? Colors.white : Colors.black),
        const Color(0xFF5DADE2)
      ],
      [
        "تسبيح",
        ImageIcon(
            const AssetImage(
                r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\muslim-tasbih.png"),
            color: isDarkMode ? Colors.white : Colors.black),
        Colors.blue.shade900
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

PageRouteBuilder downTransitionPageRouteBuilder(Widget pageToGoTo) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pageToGoTo,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
