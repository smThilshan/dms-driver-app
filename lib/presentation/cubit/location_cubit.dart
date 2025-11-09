import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../domain/entities/driver_location_entity.dart';
import '../../../domain/repositories/location_repository.dart';

class LocationCubit extends Cubit<DriverLocationEntity?> {
  final LocationRepository repository;
  final int driverId;

  LocationCubit({required this.repository, required this.driverId})
    : super(null);

  Future<void> startTracking() async {
    await Geolocator.requestPermission();
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // every 10 meters
      ),
    ).listen((Position position) async {
      final location = DriverLocationEntity(
        latitude: position.latitude,
        longitude: position.longitude,
        timestamp: DateTime.now(),
      );

      emit(location);
      await repository.updateDriverLocation(driverId, location);
    });
  }
}
