class RAGChunk {
  final String content;
  final double score;
  final Map<String, String> metadata;
  const RAGChunk({
    required this.content,
    required this.score,
    this.metadata = const {},
  });
}
