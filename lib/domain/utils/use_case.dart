import 'package:dartz/dartz.dart';
import 'failure.dart';

///
/// The abstract UseCase to be implemented by use cases that return [Either].
/// [T] Is the type to be returned by the UseCase.
/// [S] is the parameter passed to use case
///
abstract class UseCase<T, S> {
  Future<Either<Failure, T>> call(S param);
}

///
/// The abstract NoParamUseCaseSimple to be implemented by use cases that return [T].
/// [T] Is the type to be returned by the UseCase.
///
abstract class NoParamUseCaseSimple<T> {
  T call();
}
