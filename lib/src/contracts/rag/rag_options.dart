/// Options controlling a [RAGProvider.retrieve] call.
class RAGOptions {
  /// Maximum number of chunks to return.
  ///
  /// Defaults to 10. Values less than 1 are clamped to 1.
  final int maxResults;

  /// Minimum relevance score a chunk must have to be returned.
  final double? scoreThreshold;

  /// Provider-specific metadata filters.
  final Map<String, String> metadata;

  RAGOptions({
    int maxResults = 10,
    this.scoreThreshold,
    this.metadata = const {},
  }) : maxResults = maxResults < 1 ? 1 : maxResults;
}
