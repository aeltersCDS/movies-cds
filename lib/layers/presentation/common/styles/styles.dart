import 'package:flutter/material.dart';

class AppTheme {
  static const Color _green = Color.fromRGBO(1, 210, 119, 1);
  static const Color _darkGrey = Color.fromRGBO(10, 28, 36, 1);
  static const Color _lightGray = Color.fromRGBO(250, 250, 250, 1);

  static final _navigationBarTheme = NavigationBarThemeData(
    backgroundColor: _darkGrey,
    indicatorColor: _green,
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(color: Colors.black);
      }
      return const IconThemeData(color: Colors.white);
    }),
    labelTextStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(fontWeight: FontWeight.bold, color: _green);
        }
        return const TextStyle(
            fontWeight: FontWeight.normal, color: Colors.white);
      },
    ),
  );

  static const _appBarTheme = AppBarTheme(
    backgroundColor: _darkGrey,
    foregroundColor: _green,
  );

  static const _tabBarTheme = TabBarTheme(
    indicatorColor: _green,
    labelColor: _green,
    unselectedLabelColor: Colors.white,
    overlayColor: WidgetStatePropertyAll(_darkGrey),
  );

  static final _textButtonTheme =
      TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: _green));

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: _darkGrey,
      onPrimary: _green,
      surface: Colors.white,
      onSurface: Colors.black,
      secondary: _green,
      onSecondary: Colors.black,
    ),
    navigationBarTheme: _navigationBarTheme,
    appBarTheme: _appBarTheme,
    tabBarTheme: _tabBarTheme,
    textButtonTheme: _textButtonTheme,
    cardTheme: const CardTheme(color: _lightGray),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color.fromRGBO(10, 28, 36, 1),
      onPrimary: Color.fromRGBO(1, 210, 119, 1),
      surface: Colors.black,
      onSurface: Colors.white,
      secondary: Color.fromRGBO(1, 210, 119, 1),
      onSecondary: Colors.black,
    ),
    navigationBarTheme: _navigationBarTheme,
    appBarTheme: _appBarTheme,
    tabBarTheme: _tabBarTheme,
    cardTheme: const CardTheme(color: _darkGrey),
  );
}
