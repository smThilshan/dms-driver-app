import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationService {
  Timer? _timer;

  // Callback to send location data to UI (optional)
  Function(double lat, double lng, DateTime timestamp)? onLocationUpdate;

  Future<void> _sendLocationToBackend(Position position) async {
    final timestamp = DateTime.now();
    final url = Uri.parse('https://your-backend-url.com/api/driver/location');
    final body = {
      "driver_id": 1,
      "latitude": position.latitude,
      "longitude": position.longitude,
      "timestamp": timestamp.toIso8601String(),
    };

    // 🖨️ Print to console before sending
    print("📍 Current Location:");
    print("   ➤ Latitude:  ${position.latitude}");
    print("   ➤ Longitude: ${position.longitude}");
    print("   ➤ Timestamp: $timestamp");
    print("------------------------------------------------");

    // Optional callback to UI
    if (onLocationUpdate != null) {
      onLocationUpdate!(position.latitude, position.longitude, timestamp);
    }

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("✅ Location sent successfully\n");
      } else {
        print("❌ Failed to send location: ${response.statusCode}\n");
      }
    } catch (e) {
      print("⚠️ Error sending location: $e\n");
    }
  }

  Future<void> startTracking() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception("Location permission denied");
    }

    print("🚀 Starting location tracking...");

    _timer = Timer.periodic(const Duration(seconds: 10), (_) async {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      await _sendLocationToBackend(position);
    });
  }

  void stopTracking() {
    print("🛑 Stopped location tracking");
    _timer?.cancel();
  }
}
