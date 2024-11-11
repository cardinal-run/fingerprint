import 'package:fingerprint/fingerprint.dart';

import 'package:fingerprint/src/sources/platform/io.dart'
    if (dart.library.js_interop) 'js.dart' as implementation;

/// Provides source information.
SourceResult source() {
  return implementation.source();
}
