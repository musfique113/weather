import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedDayWeatherCubit extends Cubit<int> {
  SelectedDayWeatherCubit() : super(0);

  void selectDay(int dayIndex) {
    emit(dayIndex);
  }
}
