import 'package:flutter/material.dart';
import 'package:muslim_azkar/DataSources/Allah_names.dart';
import 'package:muslim_azkar/Screens/hadith_explanation.dart';

class Asma2Grid extends StatelessWidget {
  const Asma2Grid({super.key});
  // final List asma2 = Asma2HosnaData;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: const Text(
          "أسماء اللَّه الحسني",
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: Asma2HosnaData.length,
          itemBuilder: (ctx, i) {
            // This if condition is to probarly arrange the grid
            if (i % 2 == 0 && i != Asma2HosnaData.length - 1) {
              i = i + 1;
            } else if (i == Asma2HosnaData.length - 1) {
              i = i;
            } else {
              i = i - 1;
            }
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => HadithExplanationPage(
                        pageTitle: Asma2HosnaData[i]['name'],
                        sharh: Asma2HosnaData[i]['text'])));
              },
              child: Card(
                color: Theme.of(context).cardColor,
                elevation: 10,
                child: Center(
                  child: Text(
                    Asma2HosnaData[i]['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
