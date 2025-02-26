import 'package:flutter/material.dart';

class Asma2Grid extends StatelessWidget {
  const Asma2Grid({super.key, required this.asma2});
  final List<String> asma2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: const Align(
          alignment: Alignment.topRight,
          child: Text(
            "أسماء اللَّه الحسني",
            textAlign: TextAlign.end,
          ),
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: asma2.length,
          itemBuilder: (ctx, i) {
            return Card(
              elevation: 10,
              child: Center(
                child: Text(
                  asma2[i],
                  style: const TextStyle(fontSize: 40, color: Colors.green),
                ),
              ),
            );
          }),
    );
  }
}
