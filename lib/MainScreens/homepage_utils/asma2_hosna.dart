import 'dart:math';

import 'package:muslim_azkar/OtherScreens/asma2_grid.dart';
import 'package:flutter/material.dart';

List<String> _asma2AllahElHosna = [
  'الرَّحْمَنُ',
  'الرَّحِيمُ',
  'الْمَلِكُ',
  'الْقُدُّوسُ',
  'السَّلاَمُ',
  'الْمُؤْمِنُ',
  'الْمُهَيْمِنُ',
  'الْعَزِيزُ',
  'الْجَبَّارُ',
  'الْمُتَكَبِّرُ',
  'الْخَالِقُ',
  'الْبَارِئُ',
  'الْمُصَوِّرُ',
  'الْغَفَّارُ',
  'الْقَهَّارُ',
  'الْوَهَّابُ',
  'الرَّزَّاقُ',
  'الْفَتَّاحُ',
  'اَلْعَلِيْمُ',
  'الْقَابِضُ',
  'الْبَاسِطُ',
  'الْخَافِضُ',
  'الرَّافِعُ',
  'الْمُعِزُّ',
  'المُذِلُّ',
  'السَّمِيعُ',
  'الْبَصِيرُ',
  'الْحَكَمُ',
  'الْعَدْلُ',
  'اللَّطِيفُ',
  'الْخَبِيرُ',
  'الْحَلِيمُ',
  'الْعَظِيمُ',
  'الْغَفُورُ',
  'الشَّكُورُ',
  'الْعَلِيُّ',
  'الْكَبِيرُ',
  'الْحَفِيظُ',
  'المُقيِت',
  'الْحسِيبُ',
  'الْجَلِيلُ',
  'الْكَرِيمُ',
  'الرَّقِيبُ',
  'الْمُجِيبُ',
  'الْوَاسِعُ',
  'الْحَكِيمُ',
  'الْوَدُودُ',
  'الْمَجِيدُ',
  'الْبَاعِثُ',
  'الشَّهِيدُ',
  'الْحَقُّ',
  'الْوَكِيلُ',
  'الْقَوِيُّ',
  'الْمَتِينُ',
  'الْوَلِيُّ',
  'الْحَمِيدُ',
  'الْمُحْصِي',
  'الْمُبْدِئُ',
  'الْمُعِيدُ',
  'الْمُحْيِي',
  'اَلْمُمِيتُ',
  'الْحَيُّ',
  'الْقَيُّومُ',
  'الْوَاجِدُ',
  'الْمَاجِدُ',
  'الْواحِدُ',
  'اَلاَحَدُ',
  'الصَّمَدُ',
  'الْقَادِرُ',
  'الْمُقْتَدِرُ',
  'الْمُقَدِّمُ',
  'الْمُؤَخِّرُ',
  'الأوَّلُ',
  'الآخِرُ',
  'الظَّاهِرُ',
  'الْبَاطِنُ',
  'الْوَالِي',
  'الْمُتَعَالِي',
  'الْبَرُّ',
  'التَّوَابُ',
  'الْمُنْتَقِمُ',
  'العَفُوُّ',
  'الرَّؤُوفُ',
  'مَالِكُ الْمُلْكِ',
  'ذُوالْجَلاَلِ وَالإكْرَامِ',
  'الْمُقْسِطُ',
  'الْجَامِعُ',
  'الْغَنِيُّ',
  'الْمُغْنِي',
  'اَلْمَانِعُ',
  'الضَّارَّ',
  'النَّافِعُ',
  'النُّورُ',
  'الْهَادِي',
  'الْبَدِيعُ',
  'اَلْبَاقِي',
  'الْوَارِثُ',
  'الرَّشِيدُ',
  'الصَّبُورُ',
];

class Asma2Hosna extends StatefulWidget {
  const Asma2Hosna({super.key});

  @override
  State<Asma2Hosna> createState() => _Asma2HosnaState();
}

class _Asma2HosnaState extends State<Asma2Hosna> {
  String esmHasan = "";

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    int randomNumber = Random().nextInt(99);
    // print(randomNumber);
    esmHasan = _asma2AllahElHosna[randomNumber];
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) =>
                            Asma2Grid(asma2: _asma2AllahElHosna)));
                  },
                  icon: const Icon(Icons.bookmarks),
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
            Text(
              "أسماءُ اللَّهِ الحسني",
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                    fontSize: 35,
                  ),
            ),
            Text(
              esmHasan,
              style: TextStyle(
                  fontSize: 40,
                  color: isDarkMode ? Colors.black54 : Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.replay_outlined)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
