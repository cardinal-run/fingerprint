import 'package:fingerprint/fingerprint.dart';
import 'package:test/test.dart';

void main() {
  group('Fingerprint', () {
    late Map<String, Source> testSources;

    setUp(() {
      testSources = {};
    });

    test('can be instantiated', () async {
      expect(
        await Fingerprint.create(sources: testSources),
        isA<Fingerprint>(),
      );
    });

    test('can be refined', () async {
      final fingerprint = await Fingerprint.create(sources: testSources);

      expect(
        await fingerprint.refine(testSources),
        isA<Fingerprint>(),
      );
    });

    test('toString', () async {
      final fingerprint = await Fingerprint.create(sources: testSources);

      expect(
        '$fingerprint',
        equals(
          'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855',
        ),
      );
    });
  });
}
