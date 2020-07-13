import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

// This is a union type (like a Kotlin sealed class)
// freezed allows us to nest classes in dart ('cases')
// freezed also allow us to create data classes

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required String failedValue,
  }) = ShortPassword<T>;
}
