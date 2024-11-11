import 'dart:html';

import 'package:fingerprint/fingerprint.dart';

/// Provides source information.
SourceResult source() {
  if (_preferredReducedMotion('reduce')) {
    return const SourceResult.value(true);
  }
  if (_preferredReducedMotion('no-preference')) {
    return const SourceResult.value(false);
  }
  return const SourceResult.error('Unknown');
}

bool _preferredReducedMotion(String value) {
  return window.matchMedia('(prefers-reduced-motion: $value)').matches;
}
