sealed class AIError implements Exception {
  const AIError(this.message);
  final String message;
}

final class AuthenticationFailure extends AIError {
  const AuthenticationFailure(super.message);
}

final class RateLimited extends AIError {
  const RateLimited({this.retryAfterMs}) : super('Rate limited');
  final int? retryAfterMs; // retry-after in milliseconds
}

final class NetworkError extends AIError {
  const NetworkError(super.message, {this.cause});
  final Object? cause;
}

final class InvalidRequest extends AIError {
  const InvalidRequest(super.message);
}

final class ProviderFailure extends AIError {
  const ProviderFailure(super.message);
}

final class Cancelled extends AIError {
  const Cancelled() : super('Cancelled');
}
