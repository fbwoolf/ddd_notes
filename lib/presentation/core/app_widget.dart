import 'package:auto_route/auto_route.dart';
import 'package:ddd_notes/application/auth/auth_bloc.dart';
import 'package:ddd_notes/injection.dart';
import 'package:ddd_notes/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        )
      ],
      child: MaterialApp(
          title: 'Notes',
          builder: ExtendedNavigator(router: Router()),
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
              primaryColor: Colors.green[800],
              accentColor: Colors.blueAccent,
              inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              )))),
    );
  }
}
