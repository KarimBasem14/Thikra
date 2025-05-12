import 'package:flutter/material.dart';
import 'package:muslim_azkar/Screens/MainScreens/favourites_page.dart';
import 'package:muslim_azkar/Screens/MainScreens/homepage_with_sliver_app_bar.dart'
    show HomepageWithSliverAppBar;
import 'package:muslim_azkar/Screens/MainScreens/settings.dart' show Settings;
import 'package:muslim_azkar/Widgets/MainScreenWidgets/custom_nav_bar.dart'
    show CustomNavBar;

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _page = 1; // Points to the middle one
  void onTap(index) {
    setState(() {
      _page = index;
    });
  }

  final List<Widget> _pages = [
    const Settings(),
    HomepageWithSliverAppBar(),
    const FavouritesPage(),
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
