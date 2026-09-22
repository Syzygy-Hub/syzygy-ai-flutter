import 'package:test/test.dart';
import 'package:syzygy_ai_flutter/syzygy_ai_flutter.dart';
import 'package:syzygy_foundation_flutter/syzygy_foundation_flutter.dart';

void main() {
  test('LLMRequest is constructible', () {
    const req = LLMRequest(
      messages: [LLMMessage(role: MessageRole.user, content: 'hi')],
      model: 'test',
    );
    expect(req.model, equals('test'));
  });

  test('Embedding has dimensions', () {
    const emb = Embedding(values: [0.1, 0.2], dimensions: 2);
    expect(emb.dimensions, equals(2));
  });

  test('RAGChunk has score', () {
    const chunk = RAGChunk(content: 'test', score: 0.9);
    expect(chunk.score, equals(0.9));
  });

  test('AgentResult has finalAnswer', () {
    const result = AgentResult(finalAnswer: '42');
    expect(result.finalAnswer, equals('42'));
  });

  test('MemoryEntry has type', () {
    final entry = MemoryEntry(
      id: '1',
      content: 'fact',
      timestamp: SyzygyTimestamp.now(),
      type: 'fact',
    );
    expect(entry.type, equals('fact'));
  });
}
