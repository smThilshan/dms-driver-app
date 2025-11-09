import 'package:dms_driver_app/data/data/location_remote_data_source.dart';
import '../../domain/entities/driver_location_entity.dart';
import '../../domain/repositories/location_repository.dart';
import '../models/driver_location_model.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> updateDriverLocation(
    int driverId,
    DriverLocationEntity location,
  ) async {
    final model = DriverLocationModel(
      latitude: location.latitude,
      longitude: location.longitude,
      timestamp: location.timestamp,
    );
    await remoteDataSource.sendLocation(driverId, model);
  }
}
