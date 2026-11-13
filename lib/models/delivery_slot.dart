/// A delivery window offered at checkout. Times are wall-clock local times.
class DeliverySlot {
  const DeliverySlot({required this.start, required this.end});

  /// Fixed evening slots offered at checkout (start hours, 1 hour each).
  static const List<int> fixedStartHours = [19, 20, 21];
  static const Duration length = Duration(hours: 1);

  /// The fixed slots for the calendar day of [day] (local time).
  static List<DeliverySlot> fixedFor(DateTime day) => [
    for (final hour in fixedStartHours)
      DeliverySlot(
        start: DateTime(day.year, day.month, day.day, hour),
        end: DateTime(day.year, day.month, day.day, hour).add(length),
      ),
  ];

  final DateTime start;
  final DateTime end;

  /// e.g. `19:00 – 20:00`.
  String get label => '${_hhmm(start)} – ${_hhmm(end)}';

  static String _hhmm(DateTime t) {
    final local = t.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(local.hour)}:${two(local.minute)}';
  }

  Map<String, String> toJson() => {
    'start': start.toUtc().toIso8601String(),
    'end': end.toUtc().toIso8601String(),
  };

  static DeliverySlot? fromJson(Object? json) {
    if (json is! Map) return null;
    final start = DateTime.tryParse('${json['start']}');
    final end = DateTime.tryParse('${json['end']}');
    if (start == null || end == null) return null;
    return DeliverySlot(start: start, end: end);
  }

  @override
  bool operator ==(Object other) =>
      other is DeliverySlot && other.start == start && other.end == end;

  @override
  int get hashCode => Object.hash(start, end);
}
