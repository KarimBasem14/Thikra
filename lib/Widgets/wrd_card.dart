import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

PageRouteBuilder sideTransitionPageRouteBuilder(Widget pageToGoTo) {
  return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => pageToGoTo,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve =
            Curves.easeInOut; // Helps in making the animation smoother
        final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve)); // .chain helps in making it smoother too
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
