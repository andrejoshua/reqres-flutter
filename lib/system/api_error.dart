class ApiErrorException implements Exception {
  /// This exception will throw GlobalErrorResponse in the message
  /// So make sure to throw GlobalErrorResponse data
  /// And GlobalErrorResponse can be deserialized on the exception handler
  ApiErrorException(
    this.message,
    this.statusCode, {
    this.stacktrace,
  });

  final String? message;
  final int statusCode;

  final String? stacktrace;

  @override
  String toString() {
    return 'ApiErrorException: ${message ?? 'Uncaught message'}\nResponse status code: ${statusCode.toString()}${stacktrace != null ? '\n$stacktrace' : ''}';
  }
}
