import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<BaseFailure, SuccessType>> call({required Params params});
  //Left error
//Right success
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
