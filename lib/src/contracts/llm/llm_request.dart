enum MessageRole { user, assistant, system, tool }

class LLMMessage {
  final MessageRole role;
  final String content;
  const LLMMessage({required this.role, required this.content});
}

class LLMRequest {
  final List<LLMMessage> messages;
  final String model;
  final double? temperature;
  final int? maxTokens;
  final double? topP;
  final List<String> stopSequences;
  const LLMRequest({
    required this.messages,
    required this.model,
    this.temperature,
    this.maxTokens,
    this.topP,
    this.stopSequences = const [],
  });
}
