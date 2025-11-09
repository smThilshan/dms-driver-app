import 'package:dms_driver_app/domain/entities/driver_location_entity.dart';

abstract class LocationRepository {
  Future<void> updateDriverLocation(
    int driverId,
    DriverLocationEntity location,
  );
  // Future<DriverLocationEntity?> getDriverLocation(int driverId);
}
