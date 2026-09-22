import 'agent_tool.dart';

class AgentRequest {
  final String input;
  final List<AgentTool> tools;
  final int maxSteps;
  final Map<String, String> metadata;
  const AgentRequest({
    required this.input,
    this.tools = const [],
    this.maxSteps = 10, // v1.0.0 policy default: 10
    this.metadata = const {},
  });
}
