import 'package:syzygy_foundation_flutter/syzygy_foundation_flutter.dart';

class MemoryEntry {
  final String id;
  final String content;
  final Map<String, String> metadata;
  final SyzygyTimestamp timestamp;
  final String type;
  const MemoryEntry({
    required this.id,
    required this.content,
    this.metadata = const {},
    required this.timestamp,
    required this.type,
  });
}
