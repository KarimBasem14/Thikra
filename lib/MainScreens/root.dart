import 'package:muslim_azkar/MainScreens/favorite_hadiths_page.dart';
import 'package:muslim_azkar/MainScreens/homepage_utils/custom_nav_bar.dart';
import 'package:muslim_azkar/MainScreens/homepage_with_sliver_app_bar.dart';
import 'package:muslim_azkar/MainScreens/support_page.dart';
import 'package:flutter/material.dart';
import 'package:muslim_azkar/OtherScreens/settings.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _page = 2; // Points to the middle one
  void onTap(index) {
    setState(() {
      _page = index;
    });
  }

  final List<Widget> _pages = [
    const Settings(),
    const SupportPage(),
    HomepageWithSliverAppBar(),
    const FavoriteHadithsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(
        currentIndex: _page,
        onTap: onTap,
      ),
      body: IndexedStack(
        index: _page,
        children: _pages,
      ),
    );
  }
}
