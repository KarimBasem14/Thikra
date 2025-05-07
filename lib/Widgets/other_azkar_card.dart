import 'package:flutter/material.dart';

class OtherAzkarCard extends StatelessWidget {
  final String zikr;
  final double fontSize;
  const OtherAzkarCard({super.key, required this.zikr, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(zikr),
      child: Card(
        color: Theme.of(context).cardColor,
        child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 120),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  zikr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
