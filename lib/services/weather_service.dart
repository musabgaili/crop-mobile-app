import 'package:http/http.dart' as http;
class WeatherService {

   Future<http.Response> fetchWeatherData(double lat, double lng) async {
    
    final http.Response response = await http.get(Uri.parse(
        "https://api.weatherapi.com/v1/forecast.json?key=3c1a9e6c0db24174b0885735242702&days=2&q=$lat,$lng"));

    // final http.Response response =
    //     await http.get(Uri.parse("$api/mock?q=$lat,$lng"));

    return response;
  }
}