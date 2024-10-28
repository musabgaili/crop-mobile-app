import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/wather_state.dart';
import '../utils/apis.dart';

// Define the provider for weather data
final weatherProvider = FutureProvider.family.autoDispose<WeatherStateData, List<double>  >((ref, farmLocation) async {
  // Construct the API URL using variables
  // const apiUrl = '$weatherApiBaseUrl?key=$weatherApiKey&days=5&q=$location';
  var apiUrl = '$weatherApiBaseUrl?key=$weatherApiKey&days=5&q=${farmLocation[0]},${farmLocation[1]}';


  // Fetch the data from the API
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // Parse the JSON response
    final jsonResponse = json.decode(response.body) as Map<String, dynamic>;

    // Extract relevant data from the JSON response
    final current = jsonResponse['current'];
    final forecastDay1 = jsonResponse['forecast']['forecastday'][0]['day'];
    final forecastDay2 = jsonResponse['forecast']['forecastday'][1]['day'];
    final forecastDay3 = jsonResponse['forecast']['forecastday'][2]['day'];
    // final forecastDay4 = jsonResponse['forecast']['forecastday'][3]['day'];

    // Create a WeatherState object
    final weatherState = WeatherStateData(
      temperature: '${current['temp_c']} °C',
      humidity: '${current['humidity']} %',
      windSpeed: '${current['wind_kph']} kph',
      moisture: '${current['precip_mm']} mm',
      icon: '${current['condition']['icon']}',
      maxTemp: [
  '${forecastDay1['maxtemp_c']} °C',
  '${forecastDay2['maxtemp_c']} °C',
  '${forecastDay3['maxtemp_c']} °C',
        // '${forecastDay4['maxtemp_c']} °C',
      ],
      minTemp: [
  '${forecastDay1['mintemp_c']} °C',
  '${forecastDay2['mintemp_c']} °C',
  '${forecastDay3['mintemp_c']} °C',
        // '${forecastDay4['mintemp_c']} °C',
      ],
      icons: [
        // '${forecastDay1['condition']['icon']}',
        // '${forecastDay2['condition']['icon']}',
        // '${forecastDay3['condition']['icon']}',
        // '${forecastDay4['condition']['icon']}',
      ],
    );

    return weatherState;
  } else {
    throw Exception('Failed to load weather data');
  }
});
