class RAGChunk {
  final String? id;
  final String content;
  final double score;
  final Map<String, String> metadata;
  final String? source;
  final String? documentId;
  const RAGChunk({
    this.id,
    required this.content,
    required this.score,
    this.metadata = const {},
    this.source,
    this.documentId,
  });
}
