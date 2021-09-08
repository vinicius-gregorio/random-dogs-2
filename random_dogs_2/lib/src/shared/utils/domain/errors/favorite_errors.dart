class FavoriteErrors implements Exception {
  final String message;

  FavoriteErrors(this.message);

  @override
  String toString() => 'FavoriteErrors(message: $message)';
}
