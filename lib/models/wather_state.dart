class WeatherStateData {
  final String temperature;
  final String humidity;
  final String windSpeed;
  final String moisture;
  final String icon;
  final List<String> maxTemp;
  final List<String> minTemp;
  final List<String> icons;

  WeatherStateData({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.moisture,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.icons,
  });
}
