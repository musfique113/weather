import 'package:get_it/get_it.dart';
import 'package:weather/application/services/network_services/executors/network_executor.dart';
import 'package:weather/features/weather/data/repositories/weather_repository.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl
    ..registerLazySingleton(() => NetworkExecutor())
    ..registerLazySingleton(() => WeatherRepository(sl()));
}
