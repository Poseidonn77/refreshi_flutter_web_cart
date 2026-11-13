import 'dart:async';

import 'package:get/get.dart';

/// Re-runs a silent refresh when the server-side status is next expected to
/// change (see `nextStatusChange`). One pending timer at a time.
mixin StatusRefresh on GetxController {
  Timer? _refreshTimer;

  /// Small margin so the server has definitely moved on when we ask.
  static const Duration margin = Duration(milliseconds: 300);

  void scheduleRefresh(
    DateTime? at,
    Future<void> Function() refresh, {
    DateTime Function() clock = DateTime.now,
  }) {
    _refreshTimer?.cancel();
    if (at == null) return;
    var wait = at.difference(clock()) + margin;
    if (wait.isNegative) wait = margin;
    _refreshTimer = Timer(wait, () {
      if (!isClosed) refresh();
    });
  }

  @override
  void onClose() {
    _refreshTimer?.cancel();
    super.onClose();
  }
}
