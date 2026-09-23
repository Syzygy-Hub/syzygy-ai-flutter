import 'rag_chunk.dart';
import 'rag_options.dart';

abstract interface class RAGProvider {
  Future<List<RAGChunk>> retrieve(String query, int topK, {RAGOptions? options});
}
