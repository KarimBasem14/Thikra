import 'package:flutter/material.dart';
import 'package:muslim_azkar/OtherScreens/azkar_masa2.dart';
import 'package:muslim_azkar/OtherScreens/azkar_sabah.dart';

class TopMainCard extends StatelessWidget {
  const TopMainCard({
    super.key,
    required this.isNight,
  });

  final bool isNight;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          isNight
              ? Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => AzkarMasa2()))
              : Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => AzkarSabah()));
        },
        child: Column(children: [
          ListTile(
            leading: SizedBox(
              // color: Colors.green,
              height: 80,
              width: 80,
              // margin: EdgeInsets.only(left: 30),
              child: Image(
                image: isNight
                    ? const AssetImage(
                        r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\night.png")
                    : const AssetImage(
                        r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\sun.png"),
              ),
            ),
            title: Text(
              "أهلا بك",
              textAlign: TextAlign.end,
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                    fontSize:
                        60, // .copywith() takes the theme from Theme and enables you to edit the data locally too
                  ),
            ),
            subtitle: Text(
              isNight ? "عطر لسانك بأذكار المساء" : "عطر لسانك بأذكار الصباح",
              textAlign: TextAlign.end,
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                    fontSize:
                        25, // .copywith() takes the theme from Theme and enables you to edit the data locally too
                  ),
              // style: TextStyle(backgroundColor: Colors.yellow),
            ),
          ),
          Container(
            // width: 10,
            // height: 100 - 72,
            // color: Colors.red,
            margin: const EdgeInsets.only(left: 40, bottom: 20),
            child: const Align(
                alignment: Alignment.bottomLeft, child: Icon(Icons.arrow_back)),
          )
        ]),
      ),
    );
  }
}
