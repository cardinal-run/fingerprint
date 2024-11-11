import 'dart:math';

import 'package:fingerprint/fingerprint.dart';

/// Provides a source using the time zone.
SourceResult timeZone() {
  final year = DateTime.now().year;

  return SourceResult.value(
    // Daylight saving time is still a thing so we need to get the time zone
    // offset from two different dates and get the highest to ensure our entropy
    // does not change when DST hits.
    max(
      DateTime(year, 0).timeZoneOffset.inMilliseconds,
      DateTime(year, 6).timeZoneOffset.inMilliseconds,
    ),
  );
}
