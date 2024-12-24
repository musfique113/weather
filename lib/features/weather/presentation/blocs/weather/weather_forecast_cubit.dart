import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/data/repositories/weather_repository.dart';

part 'weather_forecast_state.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  WeatherForecastCubit(this._repository) : super(WeatherForecastInitial());

  final WeatherRepository _repository;

  Future<void> getWeatherForeCast({required String location}) async {
    emit(WeatherForecastInLoading());
    final response = await _repository.getWeatherForecast(location: location);
    response.fold((error) {
      emit(WeatherForecastLoadFailure(error.message));
    }, (data) {
      emit(WeatherForecastLoadSuccess(data));
    });
  }
}
