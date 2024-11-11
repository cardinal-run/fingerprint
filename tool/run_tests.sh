# Test all the non-sources tests.
flutter test --coverage --coverage-path=coverage/base_lcov.info -x sources

# Test the sources on dart io, dart web, flutter io and flutter web
dart test --coverage=coverage --platform=vm test/src/sources/io_test.dart && dart run coverage:format_coverage --lcov --in=coverage --out=coverage/io_lcov.info --packages=.dart_tool/package_config.json --report-on=lib
dart test --coverage=coverage --platform=chrome test/src/sources/js_test.dart && dart run coverage:format_coverage --lcov --in=coverage --out=coverage/js_lcov.info --packages=.dart_tool/package_config.json --report-on=lib
flutter test --coverage --coverage-path=coverage/ui_lcov.info --platform=tester test/src/sources/ui_test.dart
flutter test --coverage --coverage-path=coverage/ui_web_lcov.info --platform=chrome test/src/sources/ui_test.dart

# Remove the PWD from the paths so it is aligned with Flutter's LCOV output.
sed -i.bu "s|$(pwd)/||g" coverage/js_lcov.info
sed -i.bu "s|$(pwd)/||g" coverage/io_lcov.info

lcov -a "coverage/*_lcov.info" -o coverage/merged.lcov
