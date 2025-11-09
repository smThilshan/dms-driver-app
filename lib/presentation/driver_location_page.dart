// import 'package:dms_driver_app/domain/entities/driver_location_entity.dart';
// import 'package:dms_driver_app/presentation/location_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';

// class DriverLocationPage extends StatefulWidget {
//   final int driverId;
//   const DriverLocationPage({super.key, required this.driverId});

//   @override
//   State<DriverLocationPage> createState() => _DriverLocationPageState();
// }

// class _DriverLocationPageState extends State<DriverLocationPage> {
//   @override
//   void initState() {
//     super.initState();
//     _startTracking();
//   }

//   void _startTracking() async {
//     Geolocator.getPositionStream(
//       locationSettings: const LocationSettings(
//         accuracy: LocationAccuracy.high,
//         distanceFilter: 10,
//       ),
//     ).listen((Position pos) {
//       final location = DriverLocationEntity(
//         latitude: pos.latitude,
//         longitude: pos.longitude,
//         timestamp: DateTime.now(),
//       );
//       context.read<LocationBloc>().sendLocation(widget.driverId, location);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Driver Live Tracking')),
//       body: Center(
//         child: BlocBuilder<LocationBloc, DriverLocationEntity?>(
//           builder: (context, location) {
//             if (location == null) {
//               return const Text('Waiting for location...');
//             }
//             return Text(
//               'Lat: ${location.latitude}\nLng: ${location.longitude}',
//               style: const TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
