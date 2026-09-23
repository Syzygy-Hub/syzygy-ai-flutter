import 'package:syzygy_ai_flutter/syzygy_ai_flutter.dart';

abstract interface class NamespacedMemoryManager implements MemoryManager {
  Future<void> addToNamespace(MemoryEntry entry, String namespace);
  Future<List<MemoryEntry>> retrieveFromNamespace(String query, String namespace, {int? limit});
  Future<void> deleteEntry(String id, String namespace);
  Future<void> clearNamespace(String namespace);
}
