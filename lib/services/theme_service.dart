import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeService {
  final ThemeData _theme = ThemeData(
    textTheme: GoogleFonts.manropeTextTheme(),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
      background: const Color.fromARGB(255, 230, 230, 230),
    ),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.black,
      dividerHeight: 0.5,
      labelPadding: EdgeInsets.symmetric(horizontal: 8),
    ),
    useMaterial3: true,
  );

  ThemeData get theme => _theme;
}
