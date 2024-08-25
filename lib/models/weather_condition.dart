class WeatherCondition {
  final String description;
  final String areaName;
  final String datetime;
  final int weatherCode;
  final double temperature;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final double windSpeed;

  WeatherCondition({
    required this.areaName,
    required this.datetime,
    required this.weatherCode,
    required this.temperature,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.windSpeed,
    required this.description
  });
}
