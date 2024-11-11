import 'package:test/test.dart';

Matcher hasSource(String key, {bool withAnError = false}) {
  return matches(RegExp('$key:(${withAnError ? '' : '?!'}error)'));
}
