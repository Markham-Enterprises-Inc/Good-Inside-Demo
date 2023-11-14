import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final mainTheme = ThemeData(
  useMaterial3: true,

// Define the default brightness and colors.
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.yellow,
    primary: Colors.yellow,
    secondary: Colors.blueAccent,
    background: Colors.white,
    brightness: Brightness.light,
  ),

// Define the default `TextTheme`. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.bold,
    ),
// ···
    titleLarge: GoogleFonts.aboreto(
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),

    titleMedium: GoogleFonts.aboreto(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    titleSmall: GoogleFonts.aboreto(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    bodyLarge: GoogleFonts.roboto(fontSize: 16),
    bodyMedium: GoogleFonts.roboto(fontSize: 12),

    bodySmall: GoogleFonts.roboto(fontSize: 10),
  ),
);
