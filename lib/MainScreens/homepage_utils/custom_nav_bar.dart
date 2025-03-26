import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<CurvedNavigationBarItem> navBarItems = [];

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    navBarItems = [
      const CurvedNavigationBarItem(
          child: Icon(Icons.settings), label: "الإعدادات"),
      // CurvedNavigationBarItem(
      //   child: ImageIcon(
      //     const AssetImage(
      //         r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\love.png"),
      //     size: 32,
      //     color: isDarkMode ? Colors.white : Colors.black,
      //   ),
      //   label: "دعم",
      // ),
      const CurvedNavigationBarItem(
        child: Icon(Icons.home_outlined, size: 30),
        label: "الصفحة الرئيسية",
      ),
      const CurvedNavigationBarItem(
        child: Icon(Icons.star_outline, size: 30),
        label: "الأحاديث المفضلة",
      ),
    ];
    return CurvedNavigationBar(
      buttonBackgroundColor:
          Theme.of(context).bottomNavigationBarTheme.selectedIconTheme!.color,
      index: widget.currentIndex,
      animationDuration: const Duration(milliseconds: 300),
      color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
      key: _bottomNavigationKey,
      items: navBarItems,
      onTap: (index) => widget.onTap(index),
    );
  }
}
