// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ddd_notes/presentation/sign_in/sign_in_screen.dart';
import 'package:ddd_notes/presentation/splash/splash_screen.dart';

abstract class Routes {
  static const signInScreen = '/sign-in-screen';
  static const splashScreen = '/';
  static const all = {
    signInScreen,
    splashScreen,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignInScreen(),
          settings: settings,
        );
      case Routes.splashScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushSignInScreen() => pushNamed(Routes.signInScreen);

  Future pushSplashScreen() => pushNamed(Routes.splashScreen);
}
