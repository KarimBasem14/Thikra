import 'package:flutter/material.dart';

class TasbihCounter extends StatelessWidget {
  final Function() onPressed;
  const TasbihCounter({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text("Press me"));
  }
}
