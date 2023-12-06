import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const Base_Url = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService({required this.apiKey});

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$Base_Url?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error fetching weather');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // get permission from user
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    // fetch current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // convert the location to list of placement objects
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // extract the city name from the first placement
    String? city = placemark[0].locality;

    return city ?? "";
  }
}
