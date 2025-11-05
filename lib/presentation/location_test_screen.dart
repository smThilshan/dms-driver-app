import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationTestScreen extends StatefulWidget {
  const LocationTestScreen({super.key});

  @override
  State<LocationTestScreen> createState() => _LocationTestScreenState();
}

class _LocationTestScreenState extends State<LocationTestScreen> {
  String _location = "Unknown";

  @override
  void initState() {
    super.initState();
    _checkPermissionAndStartTracking();
  }

  Future<void> _checkPermissionAndStartTracking() async {
    // Check if location service is enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    // Check permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _location = "Permission denied");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() => _location = "Permission permanently denied");
      return;
    }

    // Start tracking position
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 10, // meters
      ),
    ).listen((Position position) {
      setState(() {
        _location = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Driver Location Tracker")),
      body: Center(
        child: Text(
          _location,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
