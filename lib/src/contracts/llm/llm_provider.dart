import 'llm_request.dart';
import 'llm_response.dart';
import 'llm_chunk.dart';

abstract interface class LLMProvider {
  Future<LLMResponse> complete(LLMRequest request);
  Stream<LLMChunk> stream(LLMRequest request);
}
