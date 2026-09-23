class TokenUsage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;
  const TokenUsage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });
}

enum FinishReason { stop, length, toolCall, contentFilter, error }

class LLMResponse {
  final String content;
  final TokenUsage? tokenUsage;
  final FinishReason? finishReason;
  final String? providerName;
  final String? modelName;
  const LLMResponse({
    required this.content,
    this.tokenUsage,
    this.finishReason,
    this.providerName,
    this.modelName,
  });
}
