import 'package:flutter/material.dart';
import 'package:muslim_azkar/Screens/other_azkar_screen.dart'
    show OtherAzkarScreen;
import 'package:muslim_azkar/theme.dart'
    show darkThemeGradient, lightThemeGradient;

class OtherAzkarTile extends StatelessWidget {
  final String title;
  const OtherAzkarTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OtherAzkarScreen(title: title)));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: isDarkMode ? darkThemeGradient : lightThemeGradient,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "<",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        title,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
