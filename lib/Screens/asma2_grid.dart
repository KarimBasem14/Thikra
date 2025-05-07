import 'package:flutter/material.dart';

class Asma2Grid extends StatelessWidget {
  const Asma2Grid({super.key, required this.asma2});
  final List<String> asma2;
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
          itemCount: asma2.length,
          itemBuilder: (ctx, i) {
            // This if condition is to probarly arrange the grid
            if (i % 2 == 0 && i != asma2.length - 1) {
              i = i + 1;
            } else if (i == asma2.length - 1) {
              i = i;
            } else {
              i = i - 1;
            }
            return Card(
              color: Theme.of(context).cardColor,
              elevation: 10,
              child: Center(
                child: Text(
                  asma2[i],
                  style: TextStyle(
                      fontSize: 40,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
              ),
            );
          }),
    );
  }
}
