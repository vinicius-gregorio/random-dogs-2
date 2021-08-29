class URLToFileError implements Exception {
  final message;

  URLToFileError({required this.message});

  @override
  String toString() => 'URLToFileError : (message: $message)';
}
