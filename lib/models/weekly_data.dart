class WeeklyData {
  final List<double> temperatures;
  final List<double> humidities;
  final List<double> lights;
  final List<double> soilMoistures;
  final List<double> tds;

  WeeklyData(
      {required this.temperatures,
      required this.humidities,
      required this.lights,
      required this.soilMoistures,
      required this.tds});

  // Factory constructor to create an instance from JSON data
  factory WeeklyData.fromJson(Map<String, dynamic> json) {
    return WeeklyData(
      temperatures: _convertToDoubleList(json['temperatures']),
      humidities: _convertToDoubleList(json['humidities']),
      lights: _convertToDoubleList(json['lights']),
      soilMoistures: _convertToDoubleList(json['soil_moistures']),
      tds: _convertToDoubleList(json['tds']),
    );
  }

  // Helper method to convert JSON data to List<double>
  // static List<double> _convertToDoubleList(Map<String, dynamic> data) {
  static List<double> _convertToDoubleList(var data) {

    // Extract values from the map and convert to List<double>
    // handle if the list is empty
    // because the api is not returning the list or if the data is not available
    // if (data == []) {
    //   return List.generate(7, (index) => 0.0);
    // }
    return data.values.map((value) {
      // Handle conversion of string to double if needed
      if (value is String) {
        return double.tryParse(value) ?? 0.0;
      } else if (value is double) {
        return value;
      }
      return 0.0;
    }).toList();
  }
}
