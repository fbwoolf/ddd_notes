import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

// This is a union type (like a Kotlin sealed class)
// freezed allows us to nest classes in dart ('cases')
// freezed also allow us to create data classes

// For a larger app you can break the failures out into separate unions
// If needed later, refer to part 11 around 27:00

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    @required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.multiline({
    @required T failedValue,
  }) = Multiline<T>;
  const factory ValueFailure.listTooLong({
    @required T failedValue,
    @required int max,
  }) = ListTooLong<T>;
  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;
}
