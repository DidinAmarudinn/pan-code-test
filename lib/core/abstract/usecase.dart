import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Failure {
  final int? statusCode;
  final String message;
  final StackTrace stackTrace;

  Failure({
    this.statusCode,
    required this.message,
    this.stackTrace = StackTrace.empty,
  });
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}
