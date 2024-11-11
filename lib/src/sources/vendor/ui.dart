import 'package:device_info_plus/device_info_plus.dart';
import 'package:fingerprint/fingerprint.dart';
import 'package:fingerprint/src/sources/vendor/io.dart' as io;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Provides source information.
Future<SourceResult> source() async {
  final plugin = DeviceInfoPlugin();

  try {
    final info = await plugin.deviceInfo;

    // If web we return early so the IO implementation gets tree-shaken out.
    if (kIsWeb) {
      return SourceResult.value((info as WebBrowserInfo).vendor ?? '');
    }

    return switch (info) {
      AndroidDeviceInfo() => SourceResult.value(info.manufacturer),
      // For iOS, macOS, Windows and Linux we can use the IO implementation as
      // the DeviceInfo wont have the info we need.
      IosDeviceInfo() ||
      MacOsDeviceInfo() ||
      WindowsDeviceInfo() ||
      LinuxDeviceInfo() =>
        io.source(),
      _ => SourceResult.error('Unable to determine vendor'),
    };
  } on PlatformException {
    return SourceResult.error('Failed to get vendor');
  }
}
