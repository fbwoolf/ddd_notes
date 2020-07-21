import 'package:auto_route/auto_route_annotations.dart';
import 'package:ddd_notes/presentation/sign_in/sign_in_screen.dart';
import 'package:ddd_notes/presentation/splash/splash_screen.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  SignInScreen signInScreen;
  @initial
  SplashScreen splashScreen;
}
