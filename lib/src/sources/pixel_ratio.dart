import 'package:fingerprint/src/sources/pixel_ratio/io.dart'
    // If the dart:ui library is present, export the UI implementation.
    if (dart.library.ui) 'pixel_ratio/ui.dart'
    // If the dart:html library is present, export the HTML implementation.
    if (dart.library.html) 'pixel_ratio/html.dart';

/// Provides a source using pixel ration information.
const pixelRatio = source;
