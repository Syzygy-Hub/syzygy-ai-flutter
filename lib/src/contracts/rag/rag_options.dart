class RAGOptions {
  final double? scoreThreshold;
  final Map<String, String> metadata;
  const RAGOptions({
    this.scoreThreshold,
    this.metadata = const {},
  });
}
