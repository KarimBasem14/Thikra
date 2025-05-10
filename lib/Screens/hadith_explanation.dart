import 'package:flutter/material.dart';

class HadithExplanationPage extends StatelessWidget {
  final String sharh; // Explanation of the hadith
  final String pageTitle;
  const HadithExplanationPage(
      {super.key, required this.pageTitle, required this.sharh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Center(
            child: Text(
              sharh,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
