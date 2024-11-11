import 'dart:js_interop';

import 'package:fingerprint/fingerprint.dart';

/// Provides source information.
SourceResult source() {
  return SourceResult.value(_Navigator.platform ?? '');
}

@JS('navigator')
@staticInterop
class _Navigator {
  @JS('platform')
  external static String? get platform;
}
