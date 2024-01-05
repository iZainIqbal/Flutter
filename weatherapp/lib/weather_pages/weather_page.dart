import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService =
      WeatherService(apiKey: 'd2b5b76ce9662e21185541811d29b4c0');
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    // get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void initState() {
    super.initState;
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 48, 16, 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // city name
              Text(_weather?.cityName ?? "Loading city....."),

              // temprature
              Text("${_weather?.temprature.round()}*C"),
            ],
          ),
        ),
      ),
    );
  }
}
