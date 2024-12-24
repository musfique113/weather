import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:weather/application/app_configuration/app_constant.dart';
import 'package:weather/application/services/local_data_source/local_data_source.dart';
import 'package:weather/application/services/network_services/entities/api_failure.dart';
import 'package:weather/application/services/network_services/entities/failure.dart';
import 'package:weather/application/services/network_services/executors/network_executor.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

class WeatherRepository {
  final NetworkExecutor _networkExecutor;
  final LocalDataSource _localDataSource;

  WeatherRepository(this._networkExecutor, this._localDataSource);

  String _weatherForecastByLocationUrl(String location) =>
      '$baseUrl/forecast.json?key=$apiKey&q=$location&days=3';

  String _weatherForecastByLagLongUrl(double? lat, double? long) =>
      '$baseUrl/forecast.json?key=$apiKey&q=$lat,$lat&days=3';

  Future<Either<Failure, WeatherModel>> getWeatherForecast({
    String? location,
    double? lat,
    double? long,
  }) async {
    final response = await _networkExecutor.getRequest(
      url: location != null
          ? _weatherForecastByLocationUrl(location)
          : _weatherForecastByLagLongUrl(lat, long),
    );

    if (response.statusCode == 200) {
      try {
        final model = WeatherModel.fromJson(jsonDecode(response.body));
        await _localDataSource.saveWeatherData(model);
        return Right(model);
      } catch (e) {
        return Left(Failure(e.toString()));
      }
    } else {
      final cachedWeather = await _localDataSource.getWeatherData();
      if (cachedWeather != null) {
        return Right(cachedWeather);
      } else {
        return Left(ApiFailure.fromJson(response.body).toEntity());
      }
    }
  }
}
