import 'package:auto_route/auto_route.dart';
import 'package:ddd_notes/application/auth/auth_bloc.dart';
import 'package:ddd_notes/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.map(
            initial: (_) {},
            authenticated: (_) {
              print('I am authenticated');
            },
            unauthenticated: (_) => ExtendedNavigator.of(context)
                .pushReplacementNamed(Routes.signInScreen),
          );
        },
        child: const Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        )));
  }
}
