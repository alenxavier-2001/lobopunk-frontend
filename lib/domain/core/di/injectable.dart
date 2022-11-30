import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/di/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
}

// final getIt = GetIt.instance;

// @InjectableInit(
//   initializerName: 'init', // default
//   preferRelativeImports: true, // default
//   asExtension: false, // default
// )
// void configureDependencies() => getIt.init();
