import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// General failures
class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnExpected extends Failure {
  final String e;
  UnExpected(this.e);
  @override
  List<Object?> get props => [];
}