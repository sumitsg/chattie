import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  final String? message;
  final int? statusCode;

  const ServerFailure({this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InvalidInputFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
