/// {@template source_result}
/// The result of a source.
/// {@endtemplate}
sealed class SourceResult {
  const SourceResult._();

  /// @macro source_result
  ///
  /// Set's the [value].
  const factory SourceResult.value(Object? value) = SourceValue._;

  /// @macro source_result
  ///
  /// Set's the [error].
  const factory SourceResult.error(Object? error) = SourceError._;
}

/// Represent a [SourceValue] that was able to retrieve the [value].
class SourceValue extends SourceResult {
  const SourceValue._(this.value) : super._();

  /// The value of the source.
  final Object? value;
}

/// Represents a [SourceResult] that encountered an [error].
class SourceError extends SourceResult {
  const SourceError._(this.error) : super._();

  /// The error of the source.
  final Object? error;
}
