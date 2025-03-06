import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:muslim_azkar/MainScreens/favorite_hadiths_page.dart';
import 'package:muslim_azkar/MainScreens/homepage.dart';
import 'package:muslim_azkar/MainScreens/main_app_bar.dart';
import 'package:muslim_azkar/MainScreens/support_page.dart';
import 'package:muslim_azkar/OtherScreens/azkar_masa2.dart';
import 'package:muslim_azkar/OtherScreens/azkar_sabah.dart';
import 'package:muslim_azkar/OtherScreens/tasbih.dart';
import 'package:flutter/material.dart';

List wrdCardPages = [
  AzkarMasa2(),
  AzkarSabah(),
  AzkarSabah(),
  const Tasbih(),
];

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 1; // Points to the middle one
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    const SupportPage(),
    HomePage(),
    const FavoriteHadithsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: MainAppBar(context),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        animationDuration: const Duration(milliseconds: 300),
        color: Theme.of(context).cardColor,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
        key: _bottomNavigationKey,
        items: <Widget>[
          ImageIcon(
            const AssetImage(
                r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\love.png"),
            size: 32,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          const Icon(Icons.home_outlined, size: 30),
          const Icon(Icons.star_outline, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: IndexedStack(
        index: _page,
        children: _pages,
      ),
    );
  }
}
