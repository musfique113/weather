part of 'location_service_cubit.dart';

class LocationServiceState extends Equatable {
  const LocationServiceState({
    required this.position,
    required this.hasPermission,
    required this.isLoading,
  });

  final Position? position;
  final bool hasPermission;
  final bool isLoading;

  LocationServiceState copyWith({
    Position? position,
    bool? hasPermission,
    bool? isLoading,
  }) {
    return LocationServiceState(
      position: position ?? this.position,
      hasPermission: hasPermission ?? this.hasPermission,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [position, hasPermission, isLoading];
}
