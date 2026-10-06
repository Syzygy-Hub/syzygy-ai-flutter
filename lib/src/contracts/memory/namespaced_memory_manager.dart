import 'memory_entry.dart';
import 'memory_manager.dart';

abstract interface class NamespacedMemoryManager implements MemoryManager {
  Future<void> addToNamespace(MemoryEntry entry, String namespace);
  Future<List<MemoryEntry>> retrieveFromNamespace(
    String query,
    String namespace, {
    int? limit,
  });
  Future<void> deleteEntry(String id, String namespace);
  Future<void> clearNamespace(String namespace);
}
