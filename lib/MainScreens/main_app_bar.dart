import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:muslim_azkar/MainScreens/homepage.dart';
// import 'package:muslim_azkar/OtherScreens/settings.dart';

AppBar mainAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Text(
      "أذكار المسلم",
      style: GoogleFonts.kufam(),
    ),
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    // leading: Builder(
    //   // Used for the drawer. To open the drawer you need to use a context under the context of the scaffold.
    //   builder: (ctx) => IconButton(
    //       onPressed: () {
    //         Navigator.of(context).push(
    //           downTransitionPageRouteBuilder(const Settings()),
    //         );
    //       },
    //       icon: const Icon(
    //         Icons.settings,
    //         color: Color.fromARGB(255, 39, 33, 33),
    //       )),
    // ),
  );
}
