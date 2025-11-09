// import 'package:dms_driver_app/domain/entities/driver_location_entity.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../domain/usecases/update_driver_location.dart';
// import '../../../domain/usecases/get_driver_location.dart';

// class LocationBloc extends Cubit<DriverLocationEntity?> {
//   final UpdateDriverLocation updateDriverLocation;
//   final GetDriverLocation getDriverLocation;

//   LocationBloc(this.updateDriverLocation, this.getDriverLocation) : super(null);

//   Future<void> sendLocation(int driverId, DriverLocationEntity location) async {
//     await updateDriverLocation(driverId, location);
//     emit(location);
//   }

//   Future<void> fetchLocation(int driverId) async {
//     final location = await getDriverLocation(driverId);
//     emit(location);
//   }
// }
