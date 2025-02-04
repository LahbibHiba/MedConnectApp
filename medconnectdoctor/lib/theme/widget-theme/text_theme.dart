import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class TTextTheme {
  //Mobile

  static TextTheme mobileTextTheme = TextTheme(
    displayLarge: GoogleFonts.raleway(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: kDarkBlueColor,
    ),
    displayMedium: GoogleFonts.raleway(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: kDarkBlueColor,
    ),
    displaySmall: GoogleFonts.raleway(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kDarkBlueColor,
    ),
    headlineMedium: GoogleFonts.raleway(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: kDarkBlueColor,
    ),
    headlineSmall: GoogleFonts.raleway(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: kDarkBlueColor,
    ),
    titleLarge: GoogleFonts.raleway(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: kDarkBlueColor,
    ),
    bodyLarge: GoogleFonts.raleway(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: kDarkBlueColor,
    ),
    bodyMedium: GoogleFonts.raleway(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: kDarkBlueColor.withOpacity(0.7),
    ),
  );
}
