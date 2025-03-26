import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "تقييم التطبيق",
              textAlign: TextAlign.right,
            ),
          ),
          ListTile(
            title: Text(
              "نشر التطبيق",
              textAlign: TextAlign.right,
            ),
          ),
          ListTile(
            title: Text(
              "تواصل معنا",
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
