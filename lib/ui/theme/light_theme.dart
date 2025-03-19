import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightThemeData = ThemeData(
  useMaterial3: true,

  brightness: Brightness.light,

  textTheme: GoogleFonts.robotoTextTheme(),

  colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen, surface: Colors.white),

  appBarTheme: AppBarTheme(
    color: Colors.lightGreen,
    foregroundColor: Colors.black,
    actionsPadding: EdgeInsets.symmetric(horizontal: 4.0),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
  ),

  cardTheme: const CardThemeData(margin: EdgeInsets.all(0)),

  chipTheme: ChipThemeData(padding: EdgeInsets.all(8.0)),
);
