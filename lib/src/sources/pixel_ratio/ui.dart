import 'package:fingerprint/fingerprint.dart';
import 'package:flutter/widgets.dart';

/// Provides source information.
SourceResult source() {
  return SourceResult.value(
    [
      for (final view in WidgetsBinding.instance.platformDispatcher.views)
        view.devicePixelRatio,
    ]..sort(),
  );
}
