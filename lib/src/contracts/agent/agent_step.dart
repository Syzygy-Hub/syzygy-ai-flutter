class AgentStep {
  final String action;
  final Map<String, dynamic> input;
  final String output;
  final Map<String, String> metadata;
  const AgentStep({
    required this.action,
    required this.input,
    required this.output,
    this.metadata = const {},
  });
}
