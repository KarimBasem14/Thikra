import 'package:muslim_azkar/MainScreens/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:muslim_azkar/api/notificationapi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 86, 207, 90),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void enableNotifications() async {
  // Initialize time zone datas
  tz.initializeTimeZones(); // This is a very important line, without it the NotificationService's sheduleNotification method raises a late initialization error

  await NotificationService.init(); // Initalize the NotificationService

  await NotificationService.enableDailyNotifications(
      true); // Enables Notifications to be repeated on a daily basis
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('isNotificationsEnabled') == null) {
    enableNotifications();
    print("enableNotifications called from main");
  } else if (prefs.getBool('isNotificationsEnabled')!) {
    enableNotifications();
    print("enableNotifications called from main");
  } else {
    await NotificationService.enableDailyNotifications(false);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark().copyWith(
          // primaryColor: Colors.red,
          scaffoldBackgroundColor: const Color.fromRGBO(38, 28, 44, 1),
          colorScheme: kDarkColorScheme,
          cardColor: const Color.fromRGBO(110, 133, 178, 1),
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: const Color.fromRGBO(92, 82, 127, 1),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ))),

      theme: ThemeData().copyWith(
          scaffoldBackgroundColor: const Color.fromRGBO(253, 245, 226, 1),
          // colorScheme: kColorScheme,
          cardColor: const Color.fromRGBO(255, 214, 164, 0.7),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Colors.amber.shade100,
            titleTextStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 30,
            ),
          )),
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(color: Colors.green),
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      //   useMaterial3: true,
      // ),
      home: MyHomePage(),
    );
  }
}
