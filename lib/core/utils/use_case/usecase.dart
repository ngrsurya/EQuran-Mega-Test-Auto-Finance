import 'package:dartz/dartz.dart';
import 'package:e_quran/core/error/failures.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseDoubleParam<Type, Params1, Params2> {
  Future<Either<Failure, Type>> call(Params1 param1, Params2 params2);
}

abstract class UseCaseTripleParam<Type, Params1, Params2, Params3> {
  Future<Either<Failure, Type>> call(
      Params1 param1, Params2 params2, Params3 params3);
}

abstract class UseCaseNoParam<Type> {
  Future<Either<Failure, Type>> call();
}

abstract class UseCaseNoReturn<Params> {
  call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
