/// Custom scalar (de)serialisers referenced from `build.yaml`.
///
/// Servers are not always strict about JSON types, and the generated code
/// otherwise does hard `as` casts, so these accept the common variants.
library;

// ---- ISODateTime ----------------------------------------------------------

/// Accepts ISO-8601 strings and epoch numbers (seconds or milliseconds).
/// Strings without a timezone are treated as UTC (not browser-local), so
/// time slots don't shift by the viewer's offset.
DateTime fromJsonIsoDateTime(dynamic value) {
  if (value is DateTime) return value.toUtc();
  if (value is num) {
    // < 1e11 can't be a millisecond timestamp after 1973 -> it's seconds.
    final ms = value.abs() < 1e11 ? value * 1000 : value;
    return DateTime.fromMillisecondsSinceEpoch(ms.round(), isUtc: true);
  }
  if (value is String) {
    final trimmed = value.trim();
    final asNumber = num.tryParse(trimmed);
    if (asNumber != null) return fromJsonIsoDateTime(asNumber);
    final parsed = DateTime.parse(trimmed);
    return parsed.isUtc || _hasZone(trimmed)
        ? parsed.toUtc()
        : DateTime.utc(
            parsed.year,
            parsed.month,
            parsed.day,
            parsed.hour,
            parsed.minute,
            parsed.second,
            parsed.millisecond,
            parsed.microsecond,
          );
  }
  throw FormatException('Invalid ISODateTime', value);
}

String toJsonIsoDateTime(DateTime value) => value.toUtc().toIso8601String();

final _zoneSuffix = RegExp(r'(Z|[+-]\d{2}(:?\d{2})?)$', caseSensitive: false);
bool _hasZone(String s) =>
    (s.contains('T') || s.contains(' ')) && _zoneSuffix.hasMatch(s);

// ---- ID -------------------------------------------------------------------

/// GraphQL `ID` may be serialised as a string or a number; normalise to String.
String fromJsonId(dynamic value) {
  if (value is String) return value;
  if (value is num) {
    return value == value.truncate() ? '${value.toInt()}' : '$value';
  }
  throw FormatException('Invalid ID', value);
}

String toJsonId(String value) => value;

// ---- Int ------------------------------------------------------------------

/// Accepts ints, integral doubles (`1250.0`, the norm in JS) and numeric
/// strings. Non-integral values are rounded (e.g. `12.5` -> `13`).
int fromJsonInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.round();
  if (value is String) {
    final parsed = num.tryParse(value.trim());
    if (parsed != null) return parsed.round();
  }
  throw FormatException('Invalid Int', value);
}

int toJsonInt(int value) => value;
