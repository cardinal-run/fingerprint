import 'package:fingerprint/fingerprint.dart';

import 'package:fingerprint/src/sources/locale/io.dart'
    if (dart.library.html) 'js.dart' as implementation;

/// Provides source information.
SourceResult source() {
  return implementation.source();
}
