import 'package:either_dart/either.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

class Empty {}
