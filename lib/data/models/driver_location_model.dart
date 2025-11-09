import 'package:dms_driver_app/domain/entities/driver_location_entity.dart';

class DriverLocationModel extends DriverLocationEntity {
  DriverLocationModel({
    required super.latitude,
    required super.longitude,
    required super.timestamp,
  });

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "timestamp": timestamp.toIso8601String(),
  };
}
