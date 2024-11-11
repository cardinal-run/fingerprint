import 'package:fingerprint/src/sources/screen_resolution/io.dart'
    // If the dart:ui library is present, export the UI implementation.
    if (dart.library.ui) 'screen_resolution/ui.dart'
    // If the dart:html library is present, export the HTML implementation.
    if (dart.library.html) 'screen_resolution/html.dart';

/// Provides a source using screen resolution.
const screenResolution = source;
