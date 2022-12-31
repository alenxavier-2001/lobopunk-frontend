import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

// final getIt = GetIt.instance;

// @InjectableInit()
// Future<void> configureInjection() async {
//   $initGetIt(getIt, environment: Environment.prod);
// }
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureInjection() async {
  getIt.init(environment: Environment.prod);
}
