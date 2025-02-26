import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class HadithCard extends StatefulWidget {
  const HadithCard({super.key});

  @override
  State<HadithCard> createState() => _HadithCardState();
}

class _HadithCardState extends State<HadithCard> {
  List<dynamic>? hadiths;
  String? currentHadith;

  @override
  void initState() {
    super.initState();
    loadDataOnStart();
  }

  Future<void> loadDataOnStart() async {
    final String response = await rootBundle.loadString(
        r'D:\Code\Flutter\muslim_azkar\lib\data\riyad_alsalhin.json');
    final data = json.decode(response);
    setState(() {
      hadiths = data['hadiths'];
      updateHadith();
    });
  }

  void updateHadith() {
    if (hadiths != null && hadiths!.isNotEmpty) {
      int randomIndex = Random().nextInt(hadiths!.length);
      setState(() {
        currentHadith = hadiths![randomIndex]['arabic'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hadiths == null) {
      return const HadithCardWithDataRetrieved(hadith: "hadith", loading: true);
    }

    return HadithCardWithDataRetrieved(
      hadith: currentHadith ?? 'جارٍ التحميل...',
      loading: false,
      onPressFunction: updateHadith,
    );
  }
}

class HadithCardWithDataRetrieved extends StatelessWidget {
  const HadithCardWithDataRetrieved({
    super.key,
    required this.hadith,
    required this.loading,
    this.onPressFunction,
  });

  final String hadith;
  final VoidCallback? onPressFunction;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      await Share.share(hadith);
                    },
                    icon: const Icon(
                      Icons.share,
                      size: 32,
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0 +
                            35.0), // adding 35 to account for the font size, and adding 32 to account for the space that the icon takes, padding just shifts the widget in this case to the right
                    child: Text(
                      "حديث اليوم",
                      style: Theme.of(context)
                          .appBarTheme
                          .titleTextStyle
                          ?.copyWith(
                            fontSize: 35,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Center(
              child: loading
                  ? const CircularProgressIndicator()
                  : Text(
                      hadith,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: "عرض شرح الحديث",
                  onPressed: () {},
                  icon: const Icon(Icons.web_sharp),
                ),
                IconButton(
                  tooltip: "اختيار حديث اخر",
                  onPressed: onPressFunction,
                  icon: const Icon(Icons.replay_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
