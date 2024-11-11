import 'package:fingerprint/src/sources/motion_reduced/io.dart'
    // If the dart:ui library is present, export the UI implementation.
    if (dart.library.ui) 'motion_reduced/ui.dart'
    // If the dart:html library is present, export the HTML implementation.
    if (dart.library.html) 'motion_reduced/html.dart';

/// Provides a source using motion reduced data.
const motionReduced = source;
