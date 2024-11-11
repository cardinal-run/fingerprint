import 'dart:js_interop';

import 'package:fingerprint/fingerprint.dart';

/// Provides source information.
SourceResult source() {
  return SourceResult.value(_Navigator.hardwareConcurrency);
}

@JS('navigator')
@staticInterop
class _Navigator {
  @JS('hardwareConcurrency')
  external static int get hardwareConcurrency;
}
