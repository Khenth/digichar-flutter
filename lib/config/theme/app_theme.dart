import 'package:flutter/material.dart';

enum AppTheme { darkTheme, lightTheme }

const seedColor = Colors.blue;
// const seedColor = Colors.green;

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: seedColor
        // colorScheme: darkColorScheme
        
        ),
    AppTheme.lightTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: seedColor
        // primaryColor: seedColor,
        // colorScheme: lightColorScheme
        ),
  };
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF26ABE2),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFB8E4F6),
  onPrimaryContainer: Color(0xFF001A40),
  secondary: Color(0xFF332E1F),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE5E4E2),
  onSecondaryContainer: Color(0xFF131B2C),
  tertiary: Color(0xFF1DF0BC),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBFFBED),
  onTertiaryContainer: Color(0xFF29132D),
  error: Color(0xFFF44336),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFF8F8F8),
  onBackground: Color(0xFF1B1B1F),
  surface: Color(0xFFF8FCFE),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFF8F8F8),
  onSurfaceVariant: Color(0xFF666257),
  outline: Color(0xFF99978F),
  onInverseSurface: Color(0xFFF2F0F4),
  inverseSurface: Color(0xFF2F3033),
  inversePrimary: Color(0xFFC8EAF7),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF2691BD),
  outlineVariant: Color(0xFFC8EAF7),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFACC7FF),
  onPrimary: Color(0xFF002F68),
  primaryContainer: Color(0xFF0A458F),
  onPrimaryContainer: Color(0xFFD7E2FF),
  secondary: Color(0xFFBEC6DC),
  onSecondary: Color(0xFF283041),
  secondaryContainer: Color(0xFF3F4759),
  onSecondaryContainer: Color(0xFFDAE2F9),
  tertiary: Color(0xFFDEBCDF),
  onTertiary: Color(0xFF402844),
  tertiaryContainer: Color(0xFF583E5B),
  onTertiaryContainer: Color(0xFFFBD7FC),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE3E2E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE3E2E6),
  surfaceVariant: Color(0xFF44474F),
  onSurfaceVariant: Color(0xFFC4C6D0),
  outline: Color(0xFF8E9099),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE3E2E6),
  inversePrimary: Color(0xFF2F5DA8),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFACC7FF),
  outlineVariant: Color(0xFF44474F),
  scrim: Color(0xFF000000),
);
