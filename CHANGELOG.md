# Changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [1.1.0] - 2026-09-24

### Added
- `JsonValue` sealed class hierarchy (`JsonNull`, `JsonBool`, `JsonNumber`, `JsonString`, `JsonArray`, `JsonObject`) with `JsonMap` typedef
- `ToolCallRequest` — structured tool-call invocation with typed `JsonMap` arguments
- `ToolCallResult` — tool-call output with `isError` flag
- `AIError` sealed class with subtypes: `AuthenticationFailure`, `RateLimited`, `NetworkError`, `InvalidRequest`, `ProviderFailure`, `Cancelled`
- `StreamContract` — documented abstract class defining streaming completion, cancellation, partial-result, and retry semantics
- `RAGOptions` — query options with `scoreThreshold` and `maxResults`
- `LLMMessage.toolCalls` and `LLMMessage.toolCallResult` fields
- `LLMRequest.requestId` and `LLMRequest.correlationId` fields
- `LLMResponse.providerName` and `LLMResponse.modelName` fields
- `LLMChunk.providerName` and `LLMChunk.modelName` fields
- `id` on `RAGChunk` — optional chunk identifier (`String?`, required in v2.0.0)
- `RAGChunk.source`, `RAGChunk.documentId` fields
- `NamespacedMemoryManager` — separate interface extending `MemoryManager` with `addToNamespace`, `retrieveFromNamespace`, `deleteEntry`, `clearNamespace` methods
- `test/contract_parity_test.dart` — compile-time shape checks for all new contracts

### Changed
- `flutter_lints` dev dependency bumped to `^6.0.0`
- Version bumped to `1.1.0`
- `RateLimited.retryAfter` (`Duration?`) replaced by `retryAfterMs` (`int?`, milliseconds)
- `MessageRole.toolCall` removed — use `MessageRole.tool` for tool-call messages
- Namespace methods moved out of `MemoryManager` into the new `NamespacedMemoryManager` interface

## [1.0.0] - 2026-09-22

### Added
- `LLMProvider` — abstract interface for LLM backend integration
- `AgentProtocol` — ReAct loop contract (Reason → Act → Observe)
- `RAGProvider` — retrieval-augmented generation interface
- `MemoryManager` — conversation context management contract
- `StreamHandler` — token streaming abstraction
