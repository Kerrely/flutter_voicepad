import 'package:get_it/get_it.dart';
import 'package:voice_pad/data/data_provider.dart';

final GetIt injector = GetIt.instance;

void initializeInjector() {
  injector.registerSingleton(DataProvider());
}
