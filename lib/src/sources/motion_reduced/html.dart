import 'dart:html';

import 'package:fingerprint/fingerprint.dart';

/// Provides source information.
SourceResult source() {
  if (_preferredReducedMotion('reduce')) {
    return SourceResult.value(true);
  }
  if (_preferredReducedMotion('no-preference')) {
    return SourceResult.value(false);
  }
  return SourceResult.error('Unknown');
}

bool _preferredReducedMotion(String value) {
  return window.matchMedia('(prefers-reduced-motion: $value)').matches;
}
