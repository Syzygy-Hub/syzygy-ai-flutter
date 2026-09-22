import 'package:syzygy_foundation_flutter/syzygy_foundation_flutter.dart';

enum TurnRole { user, assistant, system, tool }

class ConversationTurn {
  final TurnRole role;
  final String content;
  final SyzygyTimestamp timestamp;
  final Map<String, String> metadata;
  const ConversationTurn({
    required this.role,
    required this.content,
    required this.timestamp,
    this.metadata = const {},
  });
}
