class Weather {
  final String cityName;
  final double temprature;
  final String MainCondition;
  Weather(
      {required this.cityName,
      required this.temprature,
      required this.MainCondition});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temprature: json['main']['temp'].toDouble(),
      MainCondition: json['weather'][0]['main'],
    );
  }
}
