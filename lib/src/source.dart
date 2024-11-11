import 'dart:async';

import 'package:fingerprint/fingerprint.dart';

/// A source is a function that returns data about the current device.
///
/// The resulting source value should be JSON encodable, meaning it needs to
/// have a `toJson` method or is a [String], [num], [List] or [Map].
typedef Source = FutureOr<SourceResult> Function();
