part of 'weather_forecast_cubit.dart';

abstract class WeatherForecastState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherForecastInitial extends WeatherForecastState {}

class WeatherForecastInLoading extends WeatherForecastState {}

class WeatherForecastLoadSuccess extends WeatherForecastState {
  final WeatherModel data;

  WeatherForecastLoadSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class WeatherForecastLoadFailure extends WeatherForecastState {
  final String message;

  WeatherForecastLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
