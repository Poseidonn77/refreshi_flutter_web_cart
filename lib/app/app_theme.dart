import 'package:material_ui/material_ui.dart';

/// The app's blue theme, light and dark. Colours come from one seed so
/// every widget that reads `Theme.of(context).colorScheme` follows along.
abstract final class AppTheme {
  static const Color seed = Color(0xFF2563EB);

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    );
    final isLight = brightness == Brightness.light;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );

    return ThemeData(
      colorScheme: scheme,
      scaffoldBackgroundColor: isLight
          ? const Color(0xFFF3F6FC)
          : scheme.surfaceContainerLowest,
      appBarTheme: AppBarTheme(
        backgroundColor: isLight ? scheme.primary : scheme.surfaceContainer,
        foregroundColor: isLight ? scheme.onPrimary : scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 2,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
          color: isLight ? scheme.onPrimary : scheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),
      listTileTheme: ListTileThemeData(iconColor: scheme.primary, shape: shape),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(shape: shape),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(shape: shape),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: const Color(0xFFF97316),
        textColor: Colors.white,
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: scheme.primary),
    );
  }
}
