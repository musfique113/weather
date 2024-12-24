import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/application/enums/temperature_unit.dart';

class TemperatureUnitCubit extends Cubit<TemperatureUnit> {
  TemperatureUnitCubit() : super(TemperatureUnit.celsius);

  void toggleTempUnit() {
    emit(
      state == TemperatureUnit.celsius
          ? TemperatureUnit.fahrenheit
          : TemperatureUnit.celsius,
    );
  }
}
