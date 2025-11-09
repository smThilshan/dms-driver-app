// import 'package:dms_driver_app/presentation/cubit/location_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DriverHomePage extends StatelessWidget {
//   const DriverHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final locationCubit = context.read<LocationCubit>();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Driver Dashboard")),
//       body: BlocBuilder<LocationCubit, dynamic>(
//         builder: (context, state) {
//           if (state == null) {
//             return const Center(child: Text("Tracking not started"));
//           }
//           return Center(
//             child: Text(
//               "Latitude: ${state.latitude}\nLongitude: ${state.longitude}",
//               textAlign: TextAlign.center,
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: locationCubit.startTracking,
//         child: const Icon(Icons.location_on),
//       ),
//     );
//   }
// }
