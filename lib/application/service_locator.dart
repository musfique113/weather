import 'package:get_it/get_it.dart';
import 'package:weather/application/services/local_data_source/local_data_source.dart';
import 'package:weather/application/services/local_data_source/local_db_provider.dart';
import 'package:weather/application/services/location/location_services.dart';
import 'package:weather/application/services/network_services/executors/network_executor.dart';
import 'package:weather/features/weather/data/repositories/weather_repository.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl..registerLazySingleton(() => NetworkExecutor())..registerLazySingleton<
      LocalDBProvider>(() => LocalDBProvider.db)..registerLazySingleton(
        () => LocalDataSource(sl()),
  )..registerLazySingleton(
        () => WeatherRepository(sl(), sl()),
  )..registerLazySingleton(
        () => LocationService(),
  );
}
