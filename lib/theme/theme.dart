import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 86, 207, 90),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 50, 30, 97),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  canvasColor: const Color.fromARGB(118, 28, 17, 56),
  scaffoldBackgroundColor: const Color.fromARGB(255, 28, 17, 56),
  colorScheme: kDarkColorScheme,
  cardColor: const Color.fromRGBO(110, 133, 178, 1),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
    backgroundColor: Colors.white.withValues(alpha: 0),
    selectedItemColor: const Color.fromARGB(255, 28, 17, 56),
    selectedIconTheme: IconThemeData(
      color: Colors.blue[800],
    ),
  ),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: const Color.fromRGBO(92, 82, 127, 1),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 30,
    ),
  ),
);

ThemeData lightTheme = ThemeData().copyWith(
    canvasColor: const Color.fromARGB(255, 228, 197, 122),
    scaffoldBackgroundColor: const Color.fromRGBO(253, 245, 226, 1),
    cardColor: const Color.fromRGBO(255, 214, 164, 0.7),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
      backgroundColor: const Color.fromRGBO(253, 245, 226, 1),
      selectedItemColor: const Color.fromRGBO(253, 245, 226, 1),
      selectedIconTheme: IconThemeData(
        color: Colors.blue[200],
      ),
    ),
    appBarTheme: const AppBarTheme().copyWith(
      // backgroundColor: Colors.amber.shade100,
      backgroundColor: const Color(0xFFC7885D),
      titleTextStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 30,
      ),
    ));

LinearGradient darkThemeGradient = const LinearGradient(
  colors: [
    Color(0xFF6200EA), // Electric purple
    Color.fromARGB(100, 0, 187, 212), // Cyan contrast
    // Colors.pink.shade900,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient lightThemeGradient = const LinearGradient(
  colors: [
    Color(0xFFC7885D), // Warm brown
    Color(0xFFE5B07E), // Light caramel
    // Colors.pink.shade900,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
