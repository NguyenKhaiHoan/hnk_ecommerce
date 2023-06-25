import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: hDarkColor),
    displayMedium: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: hDarkColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.normal, color: hDarkColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: hDarkColor),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 18.0, fontWeight: FontWeight.normal, color: hDarkColor),
    titleLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: hDarkColor),
    bodyLarge: GoogleFonts.poppins(fontSize: 14.0, color: hDarkColor),
    bodyMedium:
        GoogleFonts.poppins(fontSize: 14.0, color: hDarkColor.withOpacity(0.8)),
    bodySmall:
        GoogleFonts.poppins(fontSize: 14.0, color: hRedColor.withOpacity(0.8)),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: hWhiteColor),
    displayMedium: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: hWhiteColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.normal, color: hWhiteColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: hWhiteColor),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 18.0, fontWeight: FontWeight.normal, color: hWhiteColor),
    titleLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: hWhiteColor),
    bodyLarge: GoogleFonts.poppins(fontSize: 14.0, color: hWhiteColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0, color: hWhiteColor.withOpacity(0.8)),
    bodySmall:
        GoogleFonts.poppins(fontSize: 14.0, color: hRedColor.withOpacity(0.8)),
  );
}
