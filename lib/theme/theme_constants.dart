import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    canvasColor: Colors.transparent,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    textTheme: GoogleFonts.loraTextTheme());

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[300],
  canvasColor: Colors.transparent,
  appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
  textTheme: GoogleFonts.loraTextTheme(),
  brightness: Brightness.dark,
);
