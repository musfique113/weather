part of 'location_service_cubit.dart';

class LocationServiceState extends Equatable {
  const LocationServiceState({
    required this.position,
    required this.hasPermission,
    required this.isLoading,
    this.showAppSettingsDialog = false,
  });

  final Position? position;
  final bool hasPermission;
  final bool isLoading;
  final bool showAppSettingsDialog;

  LocationServiceState copyWith({
    Position? position,
    bool? hasPermission,
    bool? isLoading,
    bool? showAppSettingsDialog,
  }) {
    return LocationServiceState(
      position: position ?? this.position,
      hasPermission: hasPermission ?? this.hasPermission,
      isLoading: isLoading ?? this.isLoading,
      showAppSettingsDialog:
          showAppSettingsDialog ?? this.showAppSettingsDialog,
    );
  }

  @override
  List<Object?> get props => [
        position,
        hasPermission,
        isLoading,
        showAppSettingsDialog,
      ];
}
