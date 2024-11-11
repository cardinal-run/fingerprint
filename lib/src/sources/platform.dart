import 'package:fingerprint/src/sources/platform/io.dart'
    // If the dart:ui library is present, export the UI implementation.
    if (dart.library.ui) 'platform/ui.dart'
    // If the dart:js_interop library is present, export the JS implementation.
    if (dart.library.js_interop) 'platform/js.dart';

/// Provides a source using platform information.
const platform = source;
