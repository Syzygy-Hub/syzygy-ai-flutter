import '../../types/json_value.dart';

/// A tool invocation requested by an LLM in a response.
///
/// Carries a provider-assigned [id], the tool [name], and typed [arguments].
class ToolCall {
  /// Provider-assigned identifier used to correlate the tool result.
  final String id;

  /// Name of the tool to invoke.
  final String name;

  /// Arguments to pass to the tool.
  final JsonMap arguments;

  const ToolCall({
    required this.id,
    required this.name,
    required this.arguments,
  });
}
