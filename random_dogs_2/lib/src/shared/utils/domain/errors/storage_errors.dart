class StorageErrors implements Exception {
  final String message;

  StorageErrors(this.message);

  @override
  String toString() => 'StorageErrors(message: $message)';
}
