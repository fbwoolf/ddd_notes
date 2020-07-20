import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/auth/auth_failure.dart';
import 'package:ddd_notes/domain/auth/value_objects.dart';
import 'package:flutter/foundation.dart';

// 'I' here indicates this is an Interface
// Facade here indicates this is an abstraction from Firebase auth
abstract class IAuthFacade {
  // Unit here is used in place of a void type (bc a void type does not exist)
  // void is just a keyword in dart, so we use Unit here instead
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
