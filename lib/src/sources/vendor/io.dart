import 'dart:io';

import 'package:fingerprint/fingerprint.dart';

/// Provides source information.
SourceResult source() {
  if (Platform.isIOS || Platform.isMacOS) {
    return const SourceResult.value('Apple Inc.');
  } else if (Platform.isLinux) {
    final sysVendor = File('/sys/devices/virtual/dmi/id/sys_vendor');
    if (sysVendor.existsSync()) {
      return SourceResult.value(sysVendor.readAsStringSync());
    }
  } else if (Platform.isWindows) {
    final ProcessResult(:exitCode, stdout: String stdout) = Process.runSync(
      'wmic',
      ['computersystem', 'get', 'manufacturer'],
    );

    if (exitCode == 0) {
      final vendor = stdout.split('\n').elementAtOrNull(1);
      if (vendor != null) {
        return SourceResult.value(vendor);
      }
    }
  }

  return const SourceResult.error('Unable to determine vendor');
}
