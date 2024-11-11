import 'dart:typed_data';

import 'package:fingerprint/fingerprint.dart';

/// According to the IEEE 754 standard if two infinities get subtracted from
/// each other it should result in NaN. This can be used to identify
/// x86/x86-64 architecture.
SourceResult architecture() {
  final f = Float32List(1);
  final u8 = f.buffer.asUint8List();

  f[0] = double.infinity;
  f[0] = f[0] - f[0];

  return SourceResult.value(u8[3]);
}
