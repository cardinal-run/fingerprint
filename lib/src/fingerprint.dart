import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:fingerprint/fingerprint.dart';
import 'package:fingerprint/src/sources/sources.dart' as sources;

/// {@template fingerprint}
/// Generates a unique identifier (fingerprint) based on [Source]s that you
/// provide. These sources can add entropy and uniqueness to the fingerprint to
/// ensure there is a balance between the consistency and uniqueness of a
/// fingerprint.
///
/// See the [defaultSources] for sources that are used by default.
/// {@endtemplate}
class Fingerprint {
  const Fingerprint._(this._components);

  final Map<String, SourceResult> _components;

  /// Refine this fingerprint using extra [sources] on top of the already
  /// computed components.
  Future<Fingerprint> refine(Map<String, Source> sources) {
    return Fingerprint.create(sources: sources, components: _components);
  }

  /// Create a canonical string of the fingerprint.
  String toCanonicalString() {
    final data = <String>[];
    for (final key in _components.keys) {
      final component = _components[key]!;
      final value = switch (component) {
        SourceValue() => json.encode(component.value),
        SourceError() => 'error',
      };

      data.add('$key:$value');
    }
    return data.join('|');
  }

  @override
  String toString() {
    final bytes = utf8.encode(toCanonicalString());
    return sha256.convert(bytes).toString();
  }

  /// {@macro fingerprint}
  ///
  /// Create a new [Fingerprint] using the given [sources]. If no [sources] are
  /// given it will use the [Fingerprint.defaultSources].
  ///
  /// Optionally you can pass a map of [components] that are precomputed results
  /// of sources. This is what the [refine] method uses internally to refine an
  /// existing [Fingerprint].
  static Future<Fingerprint> create({
    Map<String, Source> sources = defaultSources,
    Map<String, SourceResult> components = const {},
  }) async {
    final sourceResults = {
      for (final MapEntry(:key, value: source) in sources.entries)
        key: await source.call(),
    };

    final resultComponents = <String, SourceResult>{...components};
    for (var i = 0; i < sources.length; i++) {
      final key = sources.keys.elementAt(i);
      resultComponents[key] = sourceResults[key]!;
    }

    return Fingerprint._(resultComponents);
  }

  /// These are the default sources that [Fingerprint] uses to create an ID.
  ///
  /// If you want a specific source to not be used you can copy the map:
  /// ```dart
  /// // Remove the math source.
  /// final myMap = {...defaultSources}..remove('math');
  /// ```
  static const defaultSources = <String, Source>{
    'locale': sources.locale,
    'vendor': sources.vendor,
    'platform': sources.platform,
    'timeZone': sources.timeZone,
    'math': sources.math,
    'architecture': sources.architecture,
    'pixelRatio': sources.pixelRatio,
    'numberOfProcessors': sources.numberOfProcessors,
    'screenResolution': sources.screenResolution,
    'motionReduced': sources.motionReduced,
  };
}
