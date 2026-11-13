/// Custom scalar (de)serialisers referenced from `build.yaml`.
library;

DateTime fromJsonIsoDateTime(dynamic value) => DateTime.parse(value as String);

String toJsonIsoDateTime(DateTime value) => value.toUtc().toIso8601String();
