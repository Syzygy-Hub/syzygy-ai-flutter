import 'rag_chunk.dart';
import 'rag_options.dart';

abstract interface class RAGProvider {
  /// Retrieves chunks relevant to [query].
  ///
  /// When [options] is null, default [RAGOptions] apply (`maxResults` of 10).
  /// The result count is bounded by [RAGOptions.maxResults].
  Future<List<RAGChunk>> retrieve(String query, {RAGOptions? options});
}
