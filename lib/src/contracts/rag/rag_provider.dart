import 'rag_chunk.dart';

class RAGOptions {
  final double? scoreThreshold;
  final Map<String, String> metadata;
  const RAGOptions({this.scoreThreshold, this.metadata = const {}});
}

abstract interface class RAGProvider {
  Future<List<RAGChunk>> retrieve(
    String query,
    int topK, {
    RAGOptions? options,
  });
}
