import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_azkar/MainScreens/homepage_utils/clipper_appbar.dart';
import 'package:muslim_azkar/theme/theme.dart'
    show darkThemeGradient, lightThemeGradient;

class MainSliverAppBar extends StatelessWidget {
  const MainSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
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
                  gradient: isDarkMode ? darkThemeGradient : lightThemeGradient,
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
