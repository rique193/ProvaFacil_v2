import 'package:flutter/material.dart';

import 'color.dart';
import 'type.dart';

abstract final class ProvaFacilTheme {
  static const _darkColorScheme = ColorScheme.dark(
    primary: darkPrimary,
    onPrimary: darkOnPrimary,
    primaryContainer: darkPrimaryContainer,
    onPrimaryContainer: darkOnPrimaryContainer,
    secondary: darkSecondary,
    onSecondary: darkOnSecondary,
    secondaryContainer: darkSecondaryContainer,
    onSecondaryContainer: darkOnSecondaryContainer,
    tertiary: darkTertiary,
    onTertiary: darkOnTertiary,
    surface: darkSurface,
    onSurface: darkOnSurface,
    surfaceContainerHighest: darkSurfaceVariant,
    onSurfaceVariant: darkOnSurfaceVariant,
    outline: darkOutline,
  );

  static const _lightColorScheme = ColorScheme.light(
    primary: lightPrimary,
    onPrimary: lightOnPrimary,
    primaryContainer: lightPrimaryContainer,
    onPrimaryContainer: lightOnPrimaryContainer,
    secondary: lightSecondary,
    onSecondary: lightOnSecondary,
    secondaryContainer: lightSecondaryContainer,
    onSecondaryContainer: lightOnSecondaryContainer,
    tertiary: lightTertiary,
    onTertiary: lightOnTertiary,
    surface: lightSurface,
    onSurface: lightOnSurface,
    surfaceContainerHighest: lightSurfaceVariant,
    onSurfaceVariant: lightOnSurfaceVariant,
    outline: lightOutline,
  );

  static final ThemeData claro = _tema(_lightColorScheme, lightBackground);

  static final ThemeData escuro = _tema(_darkColorScheme, darkBackground);

  static ThemeData _tema(ColorScheme colorScheme, Color background) => ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: background,
        textTheme: typography,
      );
}
