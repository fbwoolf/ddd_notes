import 'package:firebase_auth/firebase_auth.dart';
import 'package:ddd_notes/domain/auth/user.dart';
import 'package:ddd_notes/domain/core/value_objects.dart';

extension FirebaseUserDomainX on FirebaseUser {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
