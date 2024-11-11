import 'package:fingerprint/src/sources/locale/io.dart'
    // If the dart:ui library is present, export the UI implementation.
    if (dart.library.ui) 'locale/ui.dart'
    // If the dart:js_interop library is present, export the JS implementation.
    if (dart.library.js_interop) 'locale/js.dart';

/// Provides a source using locale info.
const locale = source;
