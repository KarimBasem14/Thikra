import 'package:flutter/material.dart';
import 'package:muslim_azkar/Api/favoriteHadithBox.dart' show favoriteHadithBox;
import 'package:muslim_azkar/Screens/hadith_explanation.dart'
    show HadithExplanationPage;

import 'package:share_plus/share_plus.dart' show Share;

class FavouriteHadithCard extends StatelessWidget {
  final String hadith;
  final int id;
  const FavouriteHadithCard(
      {super.key, required this.hadith, required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            const SizedBox(height: 25),
            Center(
              child: Text(
                hadith,
                textAlign: TextAlign.center,
                style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                      fontSize: 25,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    removeFavourite(id);
                  },
                  tooltip: "حذف حديث من المفضلة لديك",
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 32,
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await Share.share(hadith);
                    },
                    icon: const Icon(
                      Icons.share,
                      size: 32,
                    )),
                IconButton(
                  tooltip: "عرض شرح الحديث",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const HadithExplanationPage(
                            pageTitle: "شرح الحديث", sharh: "لا يوجد شرح الأن"),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.info_outline_rounded,
                    size: 32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void removeFavourite(int index) {
  int ID = index;
  favoriteHadithBox.delete(ID);
}
