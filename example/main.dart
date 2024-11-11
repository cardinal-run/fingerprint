import 'dart:io';

import 'package:fingerprint/fingerprint.dart';

void main() async {
  final fingerprint = await Fingerprint.create();
  stdout
    ..writeln(fingerprint.toCanonicalString())
    ..writeln('===')
    ..writeln(fingerprint);
}
