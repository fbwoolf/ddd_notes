import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/core/errors.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  // Either<left, right>
  Either<ValueFailure<T>, T> get value;

  // Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = dartz identity function - same as writing (right) => right
    // Returns the thing unchanged
    // fold is ifLeft or ifRight
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  // Used to convert all ValueFailure types into dynamic type
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  // Check for validation
  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }

  const UniqueId._(this.value);
}
