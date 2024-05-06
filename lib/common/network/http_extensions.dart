import 'package:chattie/common/error/exceptions.dart';

class FetchDataException extends ServerException {
  final String message;
  final int statusCode;

  FetchDataException({required this.statusCode, required this.message})
      : super();

  @override
  String toString() {
    return "Fetch Exception occured with status code $statusCode : $message";
  }
}

class BadRequestException extends ServerException {
  BadRequestException({required super.statusCode, required super.message})
      : super();

  @override
  String toString() {
    return "Bad Request Exception occurred with status code $statusCode : $message";
  }
}

class UnauthorisedException extends ServerException {
  final String message;
  final int statusCode;

  UnauthorisedException({required this.statusCode, required this.message})
      : super();

  @override
  String toString() {
    return "Unauthorised Exception occured with status code $statusCode : $message";
  }
}

/// Used when api needed to hit again
/// after unauthorized or any other reason
class RetryException extends ServerException {
  RetryException() : super();

  @override
  String toString() {
    return "RetryException occurred";
  }
}

class InvalidInputException extends ServerException {
  final String message;
  final int statusCode;

  InvalidInputException({required this.statusCode, required this.message})
      : super();

  @override
  String toString() {
    return "Invalid Input Exception occured with status code $statusCode : $message";
  }
}

class AuthenticationException extends ServerException {
  final String message;
  final int statusCode;

  AuthenticationException({required this.statusCode, required this.message})
      : super();

  @override
  String toString() {
    return "Auth Exception occured with status code $statusCode : $message";
  }
}

class ParsingException extends ServerException {
  final String message;

  ParsingException({required this.message}) : super();

  @override
  String toString() {
    return "Parsing exception";
  }
}

class NotFoundException extends ServerException {
  final String message;
  final int statusCode;
  final Map<String, String> responseHeaders;
  final String body;

  NotFoundException(
      {required this.message,
      required this.statusCode,
      required this.responseHeaders,
      required this.body})
      : super();

  @override
  String toString() {
    return "NotFoundException exception $message,  status code => $statusCode,  responseHeaders ==>> $responseHeaders,  body ==>> $body";
  }
}
