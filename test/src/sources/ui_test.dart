import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:fingerprint/fingerprint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../matchers/matchers.dart';

class _MockDeviceInfoPlatform extends DeviceInfoPlatform {
  @override
  Future<BaseDeviceInfo> deviceInfo() async {
    if (kIsWeb) {
      return WebBrowserInfo(
        appCodeName: null,
        appName: null,
        appVersion: null,
        deviceMemory: null,
        language: null,
        languages: null,
        platform: null,
        product: null,
        productSub: null,
        userAgent: null,
        vendor: null,
        vendorSub: null,
        maxTouchPoints: null,
        hardwareConcurrency: null,
      );
    }
    return MacOsDeviceInfo.fromMap({
      'computerName': '',
      'hostName': '',
      'arch': '',
      'model': '',
      'kernelVersion': '',
      'osRelease': '',
      'majorVersion': 0,
      'minorVersion': 0,
      'patchVersion': 0,
      'activeCPUs': 0,
      'memorySize': 0,
      'cpuFrequency': 0,
      'systemGUID': null,
    });
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    DeviceInfoPlatform.instance = _MockDeviceInfoPlatform();
  });

  test('ui', tags: 'sources', () async {
    final fingerprint = await Fingerprint.create();

    final canonical = fingerprint.toCanonicalString();
    expect(canonical, hasSource('locale'));
    expect(canonical, hasSource('vendor'));
    expect(canonical, hasSource('platform'));
    expect(canonical, hasSource('timeZone'));
    expect(canonical, hasSource('math'));
    expect(canonical, hasSource('architecture'));
    expect(canonical, hasSource('pixelRatio'));
    expect(canonical, hasSource('numberOfProcessors'));
    expect(canonical, hasSource('screenResolution'));
    expect(canonical, hasSource('motionReduced'));
  });
}
