import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_pref_demo1/core/di/service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => await getIt.init();
