import 'memory_entry.dart';

abstract interface class MemoryManager {
  Future<void> add(MemoryEntry entry);
  Future<List<MemoryEntry>> retrieve(String query, int limit);
  Future<void> clear();
}
