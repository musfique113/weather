import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:weather/application/app_configuration/app_constant.dart';
import 'package:weather/application/services/network_services/entities/api_failure.dart';
import 'package:weather/application/services/network_services/entities/failure.dart';
import 'package:weather/application/services/network_services/executors/network_executor.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

class WeatherRepository {
  final NetworkExecutor _networkExecutor;

  WeatherRepository(this._networkExecutor);

  String _weatherForecastUrl(String location) =>
      '$baseUrl/forecast.json?key=$apiKey&q=$location&days=3';

  Future<Either<Failure, WeatherModel>> getWeatherForecast({
    required String location,
  }) async {
    final response = await _networkExecutor.getRequest(
      url: _weatherForecastUrl(location),
    );

    if (response.statusCode == 200) {
      try {
        final model = WeatherModel.fromJson(jsonDecode(response.body));
        return Right(model);
      } catch (e) {
        return Left(Failure(e.toString()));
      }
    } else {
      return Left(ApiFailure.fromJson(response.body).toEntity());
    }
  }
}
