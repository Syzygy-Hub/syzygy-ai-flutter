import 'llm_response.dart';

class LLMChunk {
  final String? content;
  final String? toolCallDelta;
  final FinishReason? finishReason;
  final Map<String, String> metadata;
  final String? providerName;
  final String? modelName;
  const LLMChunk({
    this.content,
    this.toolCallDelta,
    this.finishReason,
    this.metadata = const {},
    this.providerName,
    this.modelName,
  });
}
