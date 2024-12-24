import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/application/services/location/location_services.dart';

part 'location_service_state.dart';

class LocationServiceCubit extends Cubit<LocationServiceState> {
  final LocationService _locationService;

  LocationServiceCubit(this._locationService)
      : super(
          const LocationServiceState(
            hasPermission: false,
            isLoading: false,
            position: null,
          ),
        );

  Future<void> requestLocationPermission() async {
    emit(state.copyWith(isLoading: true));

    try {
      final serviceEnabled = await _locationService.isServiceEnabled();
      if (!serviceEnabled) {
        emit(
          state.copyWith(
            hasPermission: false,
            isLoading: false,
          ),
        );
        return;
      }

      var permission = await _locationService.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await _locationService.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(
            state.copyWith(
              hasPermission: false,
              isLoading: false,
            ),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            hasPermission: false,
            isLoading: false,
          ),
        );
        return;
      }

      final position = await _locationService.getCurrentLocation();
      emit(
        state.copyWith(
          hasPermission: true,
          position: position,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
