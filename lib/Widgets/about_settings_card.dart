import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          ListTile(
            trailing: Icon(Icons.star_border_outlined),
            title: Text(
              "تقييم التطبيق",
              textAlign: TextAlign.right,
            ),
          ),
          ListTile(
            trailing: Icon(Icons.share),
            title: Text(
              "نشر التطبيق",
              textAlign: TextAlign.right,
            ),
          ),
          ListTile(
            trailing: Icon(Icons.mail_outline_outlined),
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
