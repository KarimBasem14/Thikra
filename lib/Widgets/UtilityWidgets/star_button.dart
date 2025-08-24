import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:muslim_azkar/Api/favoriteHadithBox.dart' show favoriteHadithBox;

class StarButton extends StatefulWidget {
  final int index;
  final String hiveName;
  const StarButton({super.key, required this.hiveName, required this.index});

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      // Listen to changes in the favoriteHadithBox using Hive.box().listenable()
      valueListenable: Hive.box(widget.hiveName).listenable(),
      builder: (ctx, Box box, _) {
        final String key = widget.hiveName + widget.index.toString();
        final ValueKey valueKey = ValueKey<String>(key);
        bool isFavorite = isFavourite(box, widget.index);
        // print("key is $key and isFavorite is $isFavorite");
        return IconButton(
            onPressed: () {
              if (isFavorite) {
                removeFavourite(box, widget.index);
              } else {
                addToFavourite(box, widget.index);
              }

              setState(() {});
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_outline,
                size: 32,
                key: valueKey, // Very important
              ),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: animation,
                child: child,
              ),
            ));
      },
    );
  }
}

void addToFavourite(Box box, int index) {
  int ID = index; // The hadith's ID in the box is its index from the map
  box.put(ID, ID);
}

bool isFavourite(Box box, int index) {
  // Checks if a hadith is favorited or not.
  int ID = index; // The hadith's ID in the box is its index from the map
  return box.containsKey(ID);
}

void removeFavourite(Box box, int index) {
  int ID = index;
  box.delete(ID);
}
