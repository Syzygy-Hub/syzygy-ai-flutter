class ToolCallResult {
  const ToolCallResult({
    required this.toolCallId,
    required this.content,
    this.isError = false,
  });
  final String toolCallId;
  final String content;
  final bool isError;
}
