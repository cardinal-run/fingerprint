# fingerprint

[![build](https://github.com/cardinal-run/fingerprint/actions/workflows/main.yaml/badge.svg)](https://github.com/cardinal-run/fingerprint/actions/workflows/main.yaml)
[![pub package](https://img.shields.io/pub/v/fingerprint.svg)](https://pub.dev/packages/fingerprint)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

A package for creating fingerprints of any environment.

## ✨ Features

🔧 Automatically platform detection for `flutter`, `web`, and `io`.

🔐 By default the fingerprint is privacy friendly.

🧩 Custom sources can be provided when creating or refining a fingerprint.

## 🧑‍💻 Example

```dart
import 'package:fingerprint/fingerprint.dart';

void main() async {
  final fingerprint = await Fingerprint.create();
    
  // Shows the canonical form of the fingerprint.
  print(fingerprint.toCanonicalString());

  // Shows the hash that represents the fingerprint.
  print(fingerprint);
}cc
```

## 🎯 Accuracy

Percentage of accuracy for any given fingerprint can not be guaranteed and you should always perform
your own tests for the environment you want to use the fingerprints in.

We highly recommend refining the fingerprint with your own sources to ensure a higher accuracy:

```dart
import 'package:fingerprint/fingerprint.dart';

void main() async {
  final fingerprint = await Fingerprint.create();

  final myRefinedFingerprint = await fingerprint.refine({
    'my_custom_source': () => SourceResult.value('my_custom_value'),
    ...
  });
}
```

## 🔒 Security

Any fingerprint that is created within client-space (browsers, apps or other environments where data
cant be trusted) should be considered insecure. They are easily spoofed and their implementation can
be reversed engineered.
