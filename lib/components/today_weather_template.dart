
import 'package:cropsense/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/colors.dart';

const Color textColor = Colors.white;

class TodayWeatherTemplate extends ConsumerWidget {
final List<double> farmLocation;
  const TodayWeatherTemplate({super.key, required this.farmLocation});  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsyncValue = ref.watch(weatherProvider(farmLocation));
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            padding: const EdgeInsets.all(20.0),
            color: contrastColor,
            child: weatherAsyncValue.when(
              data: (weather) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Today',
                            style: TextStyle(fontSize: 20, color: textColor)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15),
                        const Text('Aug, 6',
                            style: TextStyle(fontSize: 20, color: textColor))
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Container(height: 1, color: mainColor),
                    const SizedBox(height: 35.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherState(
                            icon: Icons.cloud,
                            maxTemp: weather.maxTemp[0],
                            minTemp: weather.minTemp[0]),
                        WeatherState(
                            icon: Icons.cloud,
                            maxTemp: weather.maxTemp[1],
                            minTemp: weather.minTemp[1]),
                        WeatherState(
                            icon: Icons.cloud,
                            maxTemp: weather.maxTemp[2],
                            minTemp: weather.minTemp[2]),
                        WeatherState(
                            icon: Icons.cloud,
                            maxTemp: weather.maxTemp[1],
                            minTemp: weather.minTemp[0]),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
            )),
      ),
    );
  }
}

class WeatherState extends StatelessWidget {
  final IconData icon;
  final String maxTemp;
  final String minTemp;
  const WeatherState(
      {super.key,
      required this.icon,
      required this.maxTemp,
      required this.minTemp});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(maxTemp, style: const TextStyle(color: textColor)),
        const SizedBox(height: 15),
        Icon(icon, size: 25, color: textColor),
        const SizedBox(height: 15),
        Text(minTemp, style: const TextStyle(color: textColor))
      ],
    );
  }
}
