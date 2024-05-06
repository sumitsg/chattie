class ServerException implements Exception {
  final int statusCode;
  final String message;

  ServerException({this.statusCode = 0, this.message = ""});

  @override
  String toString() {
    return "$message: $statusCode";
  }
}

class CacheException implements Exception {}
