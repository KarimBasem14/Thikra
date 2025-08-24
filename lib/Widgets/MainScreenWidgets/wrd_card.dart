import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_azkar/page_animations.dart'
    show sideTransitionPageRouteBuilder;

class WrdCard extends StatelessWidget {
  const WrdCard(
      {super.key,
      required this.title,
      required this.color,
      required this.icon,
      required this.pageToGoTo});
  final Color color;
  final String title;
  final Widget
      icon; // Widget not icon as i want to be able to use ImageIcon too which for some reason is not an Icon.
  final Widget pageToGoTo;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      // height: 40,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          sideTransitionPageRouteBuilder(pageToGoTo),
        ),
        child: Card(
          elevation: 15,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon,
              Text(
                title,
                textAlign: TextAlign.end,
                style: GoogleFonts.marhey(
                    textStyle: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black54,
                        fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
      // child: ListTile(
      //   onTap: () => Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (ctx) => pageToGoTo)),
      //   title: Center(
      //     child: Text(
      //       title,
      //       textAlign: TextAlign.end,
      //       style: const TextStyle(color: Colors.white),
      //     ),
      //   ),
      //   leading: icon,
      // ),
    );
  }
}
