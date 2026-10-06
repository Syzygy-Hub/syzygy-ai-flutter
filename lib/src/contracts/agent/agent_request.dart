import 'agent_tool.dart';

class AgentRequest {
  final String input;
  final List<AgentTool> tools;

  /// Maximum number of agent steps before the run is terminated.
  ///
  /// Defaults to 10. Exceeding this limit yields a truncated response.
  /// Values less than 1 are clamped to 1.
  final int maxSteps;
  final Map<String, String> metadata;

  AgentRequest({
    required this.input,
    this.tools = const [],
    int maxSteps = 10,
    this.metadata = const {},
  }) : maxSteps = maxSteps < 1 ? 1 : maxSteps;
}
