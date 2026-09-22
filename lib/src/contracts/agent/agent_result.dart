import '../llm/llm_response.dart';
import 'agent_step.dart';

class AgentResult {
  final String finalAnswer;
  final List<AgentStep> steps;
  final TokenUsage? tokenUsage;
  const AgentResult({
    required this.finalAnswer,
    this.steps = const [],
    this.tokenUsage,
  });
}
