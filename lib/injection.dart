import 'package:ddd_notes/injection.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// injectable package is a code builder for getIt
// Generates dependency injection in iconfig
final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
