import 'package:fingerprint/src/sources/vendor/io.dart'
    // If the dart:ui library is present, export the UI implementation.
    if (dart.library.ui) 'vendor/ui.dart'
    // If the dart:js_interop library is present, export the JS implementation.
    if (dart.library.js_interop) 'vendor/js.dart';

/// Provides a source using vendor information.
const vendor = source;
