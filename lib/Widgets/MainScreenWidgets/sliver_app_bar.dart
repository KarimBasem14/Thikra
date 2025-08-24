import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_azkar/Widgets/UtilityWidgets/dua_text_in_app_bar.dart'
    show DuaTextInAppBar;
import 'package:muslim_azkar/Widgets/MainScreenWidgets/clipper_appbar.dart'
    show BackgroundWaveClipper;
import 'package:muslim_azkar/theme.dart'
    show darkThemeGradient, lightThemeGradient;

class MainSliverAppBar extends StatelessWidget {
  const MainSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 10),
      sliver: SliverAppBar(
        centerTitle: true,
        title: Text(
          "ذِكرى",
          style: GoogleFonts.kufam(),
        ),
        floating: true,
        automaticallyImplyLeading: false,
        // pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            stretchModes: const <StretchMode>[
              // StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            background: ClipPath(
              clipper: BackgroundWaveClipper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: Theme.of(context).brightness == Brightness.dark
                      ? darkThemeGradient
                      : lightThemeGradient,
                ),
                child: const SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 64.0),
                    child: Column(
                      children: [
                        DuaTextInAppBar(),
                      ],
                    ),
                  ),
                ),
              ),
            )),
        actions: const [],
        backgroundColor: Colors.transparent,
        onStretchTrigger: () async {},
        // stretchTriggerOffset: 200,
        collapsedHeight: 140,
        expandedHeight: 140,
      ),
    );
  }
}
