import 'package:fingerprint/fingerprint.dart';
import 'package:fingerprint/src/sources/motion_reduced/io.dart'
    if (dart.library.html) 'html.dart' as implementation;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Provides source information.
SourceResult source() {
  // Use the web implementation when on web as it has a higher chance of being
  // the right value.
  if (kIsWeb) {
    return implementation.source();
  }

  return SourceResult.value(
    WidgetsBinding
        .instance.platformDispatcher.accessibilityFeatures.reduceMotion,
  );
}
