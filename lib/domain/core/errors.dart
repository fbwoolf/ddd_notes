import 'package:ddd_notes/domain/core/failures.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    // safeToString ensures the string won't throw an error
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
