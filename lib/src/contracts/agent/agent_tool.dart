typedef ToolSchema = Map<String, dynamic>;
typedef ToolInput = Map<String, dynamic>;

class ToolResult {
  final String output;
  final bool isError;
  final Map<String, String> metadata;
  const ToolResult({
    required this.output,
    this.isError = false,
    this.metadata = const {},
  });
}

abstract interface class AgentTool {
  String get name;
  String get description;
  ToolSchema get inputSchema;
  Future<ToolResult> execute(ToolInput input);
}
