import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/core/errors.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
