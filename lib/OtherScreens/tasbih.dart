import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  int count = 0;
  void incrementcount() {
    HapticFeedback.mediumImpact();
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topRight,
          child: Text("تسبيح"),
        ),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(70, 50, 70, 130),
            alignment: Alignment.topCenter,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black54)),
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          ),
          GestureDetector(
            onTap: incrementcount,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Icon(Icons.replay),
              ),
            ),
            onTap: () {
              setState(() {
                count = 0;
              });
            },
          )
        ],
      ),
    );
  }
}
