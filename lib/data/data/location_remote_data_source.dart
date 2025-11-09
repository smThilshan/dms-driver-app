import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/driver_location_model.dart';

class LocationRemoteDataSource {
  final String baseUrl;

  LocationRemoteDataSource({required this.baseUrl});

  Future<void> sendLocation(int driverId, DriverLocationModel location) async {
    final url = Uri.parse('$baseUrl/drivers/$driverId/location');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(location.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send location');
    }
  }
}
