class ConvertError implements Exception {
  final String message;

  ConvertError({required this.message});

  @override
  String toString() => 'ConvertError(message: $message)';
}
