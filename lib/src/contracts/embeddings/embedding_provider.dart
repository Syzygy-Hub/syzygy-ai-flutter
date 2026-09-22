import 'embedding.dart';

abstract interface class EmbeddingProvider {
  Future<Embedding> embed(String text);
}
