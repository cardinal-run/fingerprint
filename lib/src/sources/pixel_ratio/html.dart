import 'dart:html';

import 'package:fingerprint/fingerprint.dart';

/// Provides source information.
SourceResult source() {
  return SourceResult.value(window.devicePixelRatio);
}
