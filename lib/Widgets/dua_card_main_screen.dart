import 'package:flutter/material.dart';
import 'package:muslim_azkar/Screens/dua_list.dart';

class DuaCard extends StatelessWidget {
  const DuaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const DuaList()));
          },
          child: Column(children: [
            ListTile(
              leading: const SizedBox(
                height: 70,
                width: 70,
                child: Image(
                  image: AssetImage(
                      r"D:\Code\Flutter\muslim_azkar\lib\Media\Icons\dua.png"),
                ),
              ),
              title: Text(
                "الأدعية",
                textAlign: TextAlign.end,
                style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                      fontSize:
                          50, // .copywith() takes the theme from Theme and enables you to edit the data locally too
                    ),
              ),
              subtitle: Text(
                "اقرأ ادعية من القران و السنة",
                textAlign: TextAlign.end,
                style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                      fontSize:
                          20, // .copywith() takes the theme from Theme and enables you to edit the data locally too
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
                  alignment: Alignment.bottomLeft,
                  child: Icon(Icons.arrow_back)),
            )
          ]),
        ),
      ),
    );
  }
}
