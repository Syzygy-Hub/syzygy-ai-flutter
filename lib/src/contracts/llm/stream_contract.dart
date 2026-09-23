import 'llm_chunk.dart';
import '../ai_error.dart';

/// Defines the streaming contract for LLM token delivery.
///
/// ## Completion
/// A stream ends naturally when a [LLMChunk] with a non-null [LLMChunk.finishReason]
/// is emitted. Consumers should treat this chunk as the final event; no further
/// chunks will be emitted after it.
///
/// ## Cancellation
/// Callers may cancel an in-progress stream by cancelling the [StreamSubscription]
/// returned from `Stream.listen`. Providers must release resources promptly on
/// cancellation. A [Cancelled] error is **not** emitted to the stream — cancellation
/// is a normal, non-error teardown path.
///
/// ## Partial Results
/// Every [LLMChunk] emitted before stream completion is a valid, usable partial
/// result. Consumers may accumulate [LLMChunk.content] deltas to build the full
/// response incrementally.
///
/// ## Error Propagation
/// Errors are delivered as stream errors (via `addError`), not as special chunks.
/// The stream closes after the first error. Typed errors are subtypes of [AIError].
///
/// ## Retry Semantics
/// On [NetworkError], callers may retry by submitting a new request with the same
/// [LLMRequest.requestId]. Providers that support idempotent retry will de-duplicate
/// requests sharing the same `requestId`. Other [AIError] subtypes should not be
/// retried without inspecting the error.
abstract class StreamContract {
  /// Returns a stream of [LLMChunk] events for a streaming LLM request.
  ///
  /// - Emits zero or more partial [LLMChunk] events.
  /// - Ends with a [LLMChunk] whose [LLMChunk.finishReason] is non-null.
  /// - May emit a stream error of type [AIError] on failure.
  Stream<LLMChunk> stream();
}
