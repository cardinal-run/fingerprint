import 'dart:math';

import 'package:fingerprint/fingerprint.dart';

/// Provides a source using math.
SourceResult math() {
  num powPI(num v) => pow(pi, v);
  num acoshPf(num v) => log(v + sqrt(v * v - 1));
  num asinhPf(num v) => log(v + sqrt(v * v + 1));
  num atanhPf(num v) => log((1 + v) / (1 - v)) / 2;
  num sinhPf(num v) => exp(v) - 1 / exp(v) / 2;
  num coshPf(num v) => (exp(v) + 1 / exp(v)) / 2;
  num expm1Pf(num v) => exp(v) - 1;
  num tanhPf(num v) => (exp(2 * v) - 1) / (exp(2 * v) + 1);
  num log1pPf(num v) => log(1 + v);

  return SourceResult.value({
    'acos': acos(0.123124234234234242),
    'acoshPf': acoshPf(1e154), // 1e308 will not work for polyfill
    'asin': asin(0.123124234234234242),
    'asinhPf': asinhPf(1),
    'atan': atan(0.5),
    'atanhPf': atanhPf(0.5),
    'sin': sin(-1e300),
    'sinhPf': sinhPf(1),
    'cos': cos(10.000000000123),
    'coshPf': coshPf(1),
    'tan': tan(-1e300),
    'tanhPf': tanhPf(1),
    'exp': exp(1),
    'expm1Pf': expm1Pf(1),
    'log1pPf': log1pPf(10),
    'powPI': powPI(-100),
  });
}
