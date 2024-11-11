import 'dart:js_interop';

import 'package:fingerprint/fingerprint.dart';

/// Provides source information.
SourceResult source() {
  return SourceResult.value(_Navigator.vendor);
}

@JS('navigator')
@staticInterop
class _Navigator {
  @JS('vendor')
  external static String? get vendor;
}
