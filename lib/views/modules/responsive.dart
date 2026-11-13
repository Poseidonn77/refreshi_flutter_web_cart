import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

/// Viewport classes, from the current window width (Material 3 breakpoints).
enum ScreenSize {
  mobile, // < 600
  tablet, // 600 – 1023
  desktop; // >= 1024

  static ScreenSize forWidth(double width) => width < 600
      ? mobile
      : width < 1024
      ? tablet
      : desktop;
}

/// Sizes derived from the viewport. Rebuilds when the window is resized,
/// because it reads `MediaQuery.sizeOf`.
extension Responsive on BuildContext {
  double get viewportWidth => MediaQuery.sizeOf(this).width;
  ScreenSize get screenSize => ScreenSize.forWidth(viewportWidth);
  bool get isMobile => screenSize == ScreenSize.mobile;
  bool get isDesktop => screenSize == ScreenSize.desktop;

  /// Outer page gutter.
  double get gutter => switch (screenSize) {
    ScreenSize.mobile => 16,
    ScreenSize.tablet => 24,
    ScreenSize.desktop => 32,
  };

  /// Readable max width for page content; centered beyond this.
  double get contentMaxWidth => switch (screenSize) {
    ScreenSize.mobile => double.infinity,
    ScreenSize.tablet => 720,
    ScreenSize.desktop => 1120,
  };

  /// Catalog columns.
  int get gridColumns => switch (screenSize) {
    ScreenSize.mobile => 1,
    ScreenSize.tablet => 2,
    ScreenSize.desktop => 3,
  };

  /// Padding for a scrollable page body: centers content at [contentMaxWidth]
  /// (pass [maxWidth] for narrower pages like checkout) while the scrollbar
  /// stays at the window edge. [flush] drops the mobile side gutter for
  /// lists of `ListTile`s, which already pad themselves.
  EdgeInsets pagePadding({
    double? maxWidth,
    bool flush = false,
    double top = 0,
    double bottom = 0,
  }) {
    final width = viewportWidth;
    final max = math.min(maxWidth ?? contentMaxWidth, contentMaxWidth);
    final base = flush && isMobile ? 0.0 : gutter;
    final side = max.isFinite ? math.max(base, (width - max) / 2) : base;
    return EdgeInsets.fromLTRB(side, top, side, bottom);
  }
}

/// Centers [child] and caps its width, e.g. for bottom action bars.
class MaxWidth extends StatelessWidget {
  const MaxWidth({super.key, required this.maxWidth, required this.child});

  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) => Center(
    heightFactor: 1,
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: child,
    ),
  );
}
