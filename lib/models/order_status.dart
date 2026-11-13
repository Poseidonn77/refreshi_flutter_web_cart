import '../database/schema.graphql.dart';

export '../database/schema.graphql.dart' show Enum$OrderStatus;

typedef OrderStatus = Enum$OrderStatus;

extension OrderStatusX on OrderStatus {
  String get label => switch (this) {
    OrderStatus.PLACED => 'Awaiting payment',
    OrderStatus.CONFIRMED => 'Confirmed',
    OrderStatus.OUT_FOR_DELIVERY => 'Out for delivery',
    OrderStatus.DELIVERED => 'Delivered',
    OrderStatus.$unknown => 'Unknown',
  };

  /// Statuses after which nothing changes any more.
  bool get isFinal => this == OrderStatus.DELIVERED;
}

/// When the server-side status of an order is next expected to change,
/// so the UI can refresh then (null if it won't change).
///
/// - PLACED: the payment is captured [captureAfter] after the hold
///   (retried every [retry] if the server is late).
/// - CONFIRMED -> OUT_FOR_DELIVERY at slot start; -> DELIVERED at slot end.
DateTime? nextStatusChange({
  required OrderStatus status,
  required DateTime now,
  DateTime? holdRequestTime,
  DateTime? slotStart,
  DateTime? slotEnd,
  Duration captureAfter = const Duration(seconds: 5),
  Duration retry = const Duration(seconds: 2),
}) {
  DateTime? atOrRetry(DateTime? t) =>
      t == null ? null : (t.isAfter(now) ? t : now.add(retry));
  return switch (status) {
    OrderStatus.PLACED => atOrRetry((holdRequestTime ?? now).add(captureAfter)),
    OrderStatus.CONFIRMED => atOrRetry(slotStart),
    OrderStatus.OUT_FOR_DELIVERY => atOrRetry(slotEnd),
    _ => null,
  };
}
