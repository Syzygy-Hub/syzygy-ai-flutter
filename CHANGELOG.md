# Changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [3.0.0] - 2026-10-06

### Breaking Changes
- **BREAKING:** `ToolCallRequest` removed; `ToolCall` is the single tool-call type. `LLMMessage.toolCalls` is now `List<ToolCall>?`
- **BREAKING:** Minimum `syzygy_foundation_flutter` is now `^3.0.0`
- **BREAKING:** `RAGProvider.retrieve` no longer takes a `topK` parameter; use `RAGOptions.maxResults`: `retrieve(String query, {RAGOptions? options})`
- **BREAKING:** `NetworkError` renamed to `AINetworkError` to avoid a name clash with `NetworkError` exported by `syzygy_foundation_flutter` 2.0+
- **BREAKING:** `StreamContract.stream()` now takes an `LLMRequest request` parameter, matching `LLMProvider.stream(LLMRequest)`
- **BREAKING:** `RAGOptions` is no longer a `const` constructor; `AgentRequest` is no longer a `const` constructor
- **BREAKING (dev tooling):** Lints switched from `flutter_lints` to `lints` (`package:lints/recommended.yaml`), matching Foundation

### Added
- `ToolCall` (`id`, `name`, `arguments: JsonMap`) — tool invocation requested by an LLM response; now the single tool-call type (replaces `ToolCallRequest`)
- `kSyzygyAIVersion` constant (`lib/src/version.dart`), exported from the barrel; `test/version_test.dart` asserts it matches the `pubspec.yaml` version
- `LLMRequest.tools` — optional `List<AgentTool>?` (default null)
- `LLMResponse.toolCalls` — optional `List<ToolCall>?` (default null)
- `RAGOptions.maxResults` — default 10, values below 1 clamped to 1

### Changed
- `AgentRequest.maxSteps` is documented (default 10) and values below 1 are clamped to 1
- `NamespacedMemoryManager` imports sibling files directly instead of the package barrel

## [1.1.0] - 2026-09-24

### Added
- `JsonValue` sealed class hierarchy (`JsonNull`, `JsonBool`, `JsonNumber`, `JsonString`, `JsonArray`, `JsonObject`) with `JsonMap` typedef
- `ToolCallRequest` — structured tool-call invocation with typed `JsonMap` arguments
- `ToolCallResult` — tool-call output with `isError` flag
- `AIError` sealed class with subtypes: `AuthenticationFailure`, `RateLimited`, `NetworkError` (renamed `AINetworkError` in 3.0.0), `InvalidRequest`, `ProviderFailure`, `Cancelled`
- `StreamContract` — documented abstract class defining streaming completion, cancellation, partial-result, and retry semantics
- `RAGOptions` — query options with `scoreThreshold` and `metadata`
- `LLMMessage.toolCalls` and `LLMMessage.toolCallResult` fields
- `LLMRequest.requestId` and `LLMRequest.correlationId` fields
- `LLMResponse.providerName` and `LLMResponse.modelName` fields
- `LLMChunk.providerName` and `LLMChunk.modelName` fields
- `id` on `RAGChunk` — optional chunk identifier (`String?`)
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

[Unreleased]: https://github.com/Syzygy-Hub/syzygy-ai-flutter/compare/3.0.0...HEAD
[3.0.0]: https://github.com/Syzygy-Hub/syzygy-ai-flutter/compare/1.1.0...3.0.0
[1.1.0]: https://github.com/Syzygy-Hub/syzygy-ai-flutter/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/Syzygy-Hub/syzygy-ai-flutter/releases/tag/1.0.0
