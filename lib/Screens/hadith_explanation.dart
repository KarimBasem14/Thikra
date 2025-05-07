import 'package:flutter/material.dart';

class HadithExplanationPage extends StatelessWidget {
  final String sharh; // Explanation of the hadith
  const HadithExplanationPage({super.key, required this.sharh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("شرح الحديث"),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Text(
            sharh,
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
