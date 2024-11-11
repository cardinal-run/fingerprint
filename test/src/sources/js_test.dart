@TestOn('js')
library js_test;

import 'package:fingerprint/fingerprint.dart';
import 'package:test/test.dart';

import '../../matchers/matchers.dart';

void main() {
  test('js', tags: 'sources', () async {
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
