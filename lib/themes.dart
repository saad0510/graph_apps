import 'package:flutter/material.dart';

class AppThemes {
  static final cryptoApp = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1A1C28),
    canvasColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      toolbarHeight: 100,
      color: Colors.transparent,
    ),
    dividerTheme: const DividerThemeData(thickness: 0.8),
    chipTheme: const ChipThemeData(
      backgroundColor: Color(0xFF242736),
      padding: EdgeInsets.zero,
      labelStyle: TextStyle(
        fontSize: 11,
        color: Colors.grey,
        fontWeight: FontWeight.normal,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      dense: true,
      minVerticalPadding: 9,
      minLeadingWidth: 0,
      contentPadding: EdgeInsets.symmetric(horizontal: 25),
      visualDensity: VisualDensity.compact,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 36,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFFBDBEC2),
      ),
      titleMedium: TextStyle(
        fontSize: 11,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    ),
  );

  static final authWeb = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff2A92EC),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff2A92EC),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        shape: const StadiumBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      labelStyle: const TextStyle(fontSize: 14),
      filled: true,
      fillColor: const Color(0xFF3E4358),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xff2A92EC),
          width: 2,
        ),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        color: Color(0xFF9AA5B5),
        fontWeight: FontWeight.normal,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        color: Color(0xFF9AA5B5),
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final dashBoardWeb = ThemeData(
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2b234d),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFF2b234d),
      ),
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w900,
        color: Color(0xFF2b234d),
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Color(0xFF2b234d),
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w900,
        color: Color(0xFF2b234d),
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF2b234d)),
    cardTheme: CardTheme(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );

  static final statsWeb = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF29263d),
    iconTheme: const IconThemeData(color: Color(0xFF9994ba), size: 22),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(width: 0, color: Color(0xFF29263d)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(width: 0, color: Color(0xFF29263d)),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      filled: true,
      fillColor: Colors.white10,
      prefixIconColor: Colors.deepPurple.shade100,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        color: Colors.deepPurple.shade100,
      ),
    ),
  );
}
