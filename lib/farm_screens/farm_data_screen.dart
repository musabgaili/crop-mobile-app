
// import 'package:cropsense/archive/components/home_page_components/colored_bar_chart.dart';
// import 'package:cropsense/archive/components/today_weather_template.dart';
import 'package:cropsense/components/home_page_components/colored_bar_chart.dart';
import 'package:cropsense/components/today_weather_template.dart';
import 'package:cropsense/farm_screens/fertilization_data_screen.dart';
import 'package:cropsense/global_widgets/colored_button.dart';
import 'package:cropsense/models/farm.dart';
import 'package:cropsense/providers/farm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/colors.dart';

// ignore: must_be_immutable
class FarmDataScreen extends ConsumerWidget {
  FarmDataScreen({super.key, required this.farm});
  Farm farm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmProvider = ref.watch(singleFarmProvider(farm));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios),
        title: Center(
            child: Text(farmProvider.farm.name,
                style: const TextStyle(fontSize: 26, color: Colors.black))),
      ),
      body: SingleChildScrollView(
        child: farmProvider.isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Center(child: CircularProgressIndicator())),
                  const SizedBox(height: 20),
                  const Text("Loading Data...")
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // const WeatherWidget(),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) =>
                  //                   FertilizationDataScreen(
                  //                     farm : farm,
                  //                   )));
                  //     },
                  //     child: Text('Regeister Fertilization Process')),
                  // Text(jsonDecode(farmProvider.farm.points.toString())[0],),
                  ColoredButton(
                      color: mainColor,
                      text: 'Regeister Farm Operation',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FertilizationDataScreen(
                                      farm: farm,
                                    )));
                      }),
                  const SizedBox(height: 40),

                  TodayWeatherTemplate(farmLocation: farmProvider.farmLocation),

                  // Divider(
                  //   height: 10,
                  //   color: Colors.red,
                  // ),

                  // Humidity Chart
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  if (farmProvider.weeklyData!.humidities.isEmpty)
                    const SizedBox(
                      height: 35,
                      child: Text("No Humidity Available"),
                    )
                  else
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ColoredBarChart(
                            weeklySummary: farmProvider.weeklyData!.humidities,
                            barColor: mainColor,
                            name: "Humidities")),
                  // End of Humidity Chart

                  // Temperature Chart
                  if (farmProvider.weeklyData!.temperatures.isEmpty)
                    const SizedBox(
                      height: 35,
                      child: Text("No Temperature Available"),
                    )
                  else
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ColoredBarChart(
                            weeklySummary:
                                farmProvider.weeklyData!.temperatures,
                            barColor: contrastColor,
                            name: 'Temperature')),
                  // End of Temperature Chart

                  // TDS Chart
                  if (farmProvider.weeklyData!.temperatures.isEmpty)
                    const SizedBox(
                      height: 35,
                      child: Text("No TDS Available"),
                    )
                  else
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ColoredBarChart(
                            weeklySummary: farmProvider.weeklyData!.tds,
                            barColor: mainColor,
                            name: 'TDS')),
                  // End of TDS Chart

                  // Soil Moisture Chart
                  if (farmProvider.weeklyData!.temperatures.isEmpty)
                    const SizedBox(
                      height: 35,
                      child: Text("No Soil Moisture Available"),
                    )
                  else
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ColoredBarChart(
                            weeklySummary:
                                farmProvider.weeklyData!.soilMoistures,
                            barColor: contrastColor,
                            name: 'Soil Moisture')),
                  // End of Soil Moisture Chart

                  // Light Chart
                  if (farmProvider.weeklyData!.temperatures.isEmpty)
                    const SizedBox(
                      height: 35,
                      child: Text("No Light Available"),
                    )
                  else
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ColoredBarChart(
                            weeklySummary: farmProvider.weeklyData!.lights,
                            barColor: mainColor,
                            name: 'Light')),
                  // End of Light Chart

                  // const WeeklySummaryChart(),
                  // const Text('Weather', textAlign: TextAlign.center),
                ],
              ),
      ),
    );
  }
}
