part of 'sign_in_form_bloc.dart';

// This is generated with the bloc ext library
// @immutable
// abstract class SignInFormState {}

// class SignInFormInitial extends SignInFormState {}

// This is creating state as a data class using freezed
// The import is actually in the sign_in_form_bloc file bc this is a part file
@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    @required
        EmailAddress
            emailAddress, // the validated email address value object from the domain auth
    @required
        Password
            password, // the validated password value object from the domain auth
    @required bool showErrorMessages,
    @required bool isSubmitting,
    // Option<None, Some>
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
