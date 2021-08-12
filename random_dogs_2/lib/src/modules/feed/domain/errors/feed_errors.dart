class FeedError implements Exception {
  final String message;

  FeedError({required this.message});

  @override
  String toString() => 'FeedError(message: $message)';
}
