import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:muslim_azkar/UtilityWidgets/other_azkar_card.dart';
import 'package:muslim_azkar/data/other_azkars_title.dart';

class OtherAzkar extends StatelessWidget {
  OtherAzkar({super.key});

  final List otherAzkarList = otherAzkarMap.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "أذكار متنوعة",
          style: GoogleFonts.kufam(),
        ),
      ),
      body: ListView.builder(
          itemCount: otherAzkarMap.length,
          itemBuilder: (context, index) {
            return OtherAzkarCard(title: otherAzkarList[index]);
          }),
    );
  }
}
