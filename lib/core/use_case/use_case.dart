import 'dart:async';

import '../either.dart';
import '../error/failure.dart';

abstract class UseCase<Error, Type, Params> {
  FutureOr<Either<Failure<Error>, Type>> call(Params params);
}
