import 'dart:io';

import 'package:fingerprint/fingerprint.dart';

/// Provides source information.
SourceResult source() {
  return SourceResult.value(Platform.numberOfProcessors);
}
