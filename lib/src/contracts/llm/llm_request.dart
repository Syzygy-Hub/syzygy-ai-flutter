import 'tool_call_request.dart';
import 'tool_call_result.dart';

enum MessageRole { user, assistant, system, tool }

class LLMMessage {
  final MessageRole role;
  final String content;
  final List<ToolCallRequest>? toolCalls;
  final ToolCallResult? toolCallResult;
  const LLMMessage({
    required this.role,
    required this.content,
    this.toolCalls,
    this.toolCallResult,
  });
}

class LLMRequest {
  final List<LLMMessage> messages;
  final String model;
  final double? temperature;
  final int? maxTokens;
  final double? topP;
  final List<String> stopSequences;
  final String? requestId;
  final String? correlationId;
  const LLMRequest({
    required this.messages,
    required this.model,
    this.temperature,
    this.maxTokens,
    this.topP,
    this.stopSequences = const [],
    this.requestId,
    this.correlationId,
  });
}
