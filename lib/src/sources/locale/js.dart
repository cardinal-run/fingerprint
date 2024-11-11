import 'dart:js_interop';

import 'package:fingerprint/fingerprint.dart';

/// Provides source information.
SourceResult source() {
  final language = _Navigator.language;
  final languages = _Navigator.languages;
  return SourceResult.value([
    if (language != null) [language],
    if (languages != null && languages.isNotEmpty) languages.toList(),
  ]);
}

@JS('navigator')
@staticInterop
class _Navigator {
  @JS('languages')
  external static JSArray<JSString>? get languages;

  @JS('language')
  external static String? get language;
}

extension on JSArray<JSString> {
  bool get isNotEmpty => toDart.isNotEmpty;

  List<String> toList() => toDart.map((e) => e.toDart).toList();
}
