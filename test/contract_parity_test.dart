import 'package:syzygy_ai_flutter/syzygy_ai_flutter.dart';
import 'package:test/test.dart';

void main() {
  group('JsonValue contract parity', () {
    test('JsonNull instantiates', () {
      const v = JsonNull();
      expect(v, isA<JsonValue>());
    });

    test('JsonBool instantiates', () {
      const v = JsonBool(true);
      expect(v.value, isTrue);
    });

    test('JsonNumber instantiates', () {
      const v = JsonNumber(3.14);
      expect(v.value, 3.14);
    });

    test('JsonString instantiates', () {
      const v = JsonString('hello');
      expect(v.value, 'hello');
    });

    test('JsonArray instantiates', () {
      const v = JsonArray([JsonNull()]);
      expect(v.value, hasLength(1));
    });

    test('JsonObject instantiates', () {
      const v = JsonObject({'key': JsonNull()});
      expect(v.value.containsKey('key'), isTrue);
    });
  });

  group('ToolCallRequest contract parity', () {
    test('has id, name, arguments fields', () {
      const req = ToolCallRequest(
        id: 'call-1',
        name: 'search',
        arguments: {'q': JsonString('dart')},
      );
      expect(req.id, 'call-1');
      expect(req.name, 'search');
      expect(req.arguments, isNotEmpty);
    });
  });

  group('ToolCallResult contract parity', () {
    test('has toolCallId, content, isError fields', () {
      const res = ToolCallResult(toolCallId: 'call-1', content: 'result');
      expect(res.toolCallId, 'call-1');
      expect(res.content, 'result');
      expect(res.isError, isFalse);
    });

    test('isError can be set to true', () {
      const res = ToolCallResult(
        toolCallId: 'call-2',
        content: 'oops',
        isError: true,
      );
      expect(res.isError, isTrue);
    });
  });

  group('LLMMessage contract parity', () {
    test('supports tool role with toolCalls', () {
      const msg = LLMMessage(
        role: MessageRole.tool,
        content: '',
        toolCalls: [],
      );
      expect(msg.role, MessageRole.tool);
      expect(msg.toolCalls, isEmpty);
    });

    test('supports toolCallResult field', () {
      const result = ToolCallResult(toolCallId: 'x', content: 'ok');
      const msg = LLMMessage(
        role: MessageRole.tool,
        content: '',
        toolCallResult: result,
      );
      expect(msg.toolCallResult?.toolCallId, 'x');
    });
  });

  group('LLMRequest contract parity', () {
    test('has requestId and correlationId fields', () {
      const req = LLMRequest(
        messages: [],
        model: 'gpt-4',
        requestId: 'req-123',
        correlationId: 'corr-456',
      );
      expect(req.requestId, 'req-123');
      expect(req.correlationId, 'corr-456');
    });
  });

  group('LLMResponse contract parity', () {
    test('has providerName and modelName fields', () {
      const resp = LLMResponse(
        content: 'hello',
        providerName: 'openai',
        modelName: 'gpt-4',
      );
      expect(resp.providerName, 'openai');
      expect(resp.modelName, 'gpt-4');
    });
  });

  group('LLMChunk contract parity', () {
    test('has providerName and modelName fields', () {
      const chunk = LLMChunk(
        content: 'tok',
        providerName: 'anthropic',
        modelName: 'claude-3',
      );
      expect(chunk.providerName, 'anthropic');
      expect(chunk.modelName, 'claude-3');
    });
  });

  group('AIError contract parity', () {
    test('AuthenticationFailure is AIError', () {
      const e = AuthenticationFailure('bad key');
      expect(e, isA<AIError>());
      expect(e.message, 'bad key');
    });

    test('RateLimited has retryAfterMs', () {
      const e = RateLimited(retryAfterMs: 30000);
      expect(e.retryAfterMs, 30000);
    });

    test('NetworkError has cause', () {
      const e = NetworkError('timeout', cause: 'socket closed');
      expect(e.cause, 'socket closed');
    });

    test('InvalidRequest is AIError', () {
      const e = InvalidRequest('bad param');
      expect(e, isA<AIError>());
    });

    test('ProviderFailure is AIError', () {
      const e = ProviderFailure('upstream 500');
      expect(e, isA<AIError>());
    });

    test('Cancelled is AIError', () {
      const e = Cancelled();
      expect(e.message, 'Cancelled');
    });
  });

  group('RAGChunk contract parity', () {
    test('has id, source, documentId fields', () {
      const chunk = RAGChunk(
        id: 'chunk-1',
        content: 'text',
        score: 0.9,
        source: 'doc.pdf',
        documentId: 'doc-42',
      );
      expect(chunk.id, 'chunk-1');
      expect(chunk.source, 'doc.pdf');
      expect(chunk.documentId, 'doc-42');
    });
  });

  group('RAGOptions contract parity', () {
    test('has scoreThreshold and metadata', () {
      const opts = RAGOptions(scoreThreshold: 0.7, metadata: {'source': 'doc'});
      expect(opts.scoreThreshold, 0.7);
      expect(opts.metadata, {'source': 'doc'});
    });

    test('metadata defaults to empty map', () {
      const opts = RAGOptions(scoreThreshold: 0.5);
      expect(opts.metadata, isEmpty);
    });
  });
}
