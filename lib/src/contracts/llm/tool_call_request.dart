import '../../types/json_value.dart';

class ToolCallRequest {
  const ToolCallRequest({
    required this.id,
    required this.name,
    required this.arguments,
  });
  final String id;
  final String name;
  final JsonMap arguments;
}
