import 'package:ddd_notes/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:ddd_notes/injection.dart';
import 'package:ddd_notes/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
        body: BlocProvider(
            // getIt here allows for dependency injection of IAuthFacade
            // This has been configured in injection.iconfig
            create: (context) => getIt<SignInFormBloc>(),
            child: SignInForm()));
  }
}
