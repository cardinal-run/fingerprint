import 'package:fingerprint/src/sources/number_of_processors/io.dart'
    // If the dart:ui library is present, export the UI implementation.
    if (dart.library.ui) 'number_of_processors/ui.dart'
    // If the dart:js_interop library is present, export the JS implementation.
    if (dart.library.js_interop) 'number_of_processors/js.dart';

/// Provides a source using the number of processors.
const numberOfProcessors = source;
