import 'package:dms_driver_app/domain/entities/driver_location_entity.dart';
import '../repositories/location_repository.dart';

class UpdateDriverLocationUseCase {
  final LocationRepository repository;

  UpdateDriverLocationUseCase(this.repository);

  Future<void> call(int driverId, DriverLocationEntity location) async {
    await repository.updateDriverLocation(driverId, location);
  }
}
