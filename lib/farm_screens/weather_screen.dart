import 'package:flutter/material.dart';
import '../global_widgets/custom_appbar.dart';
import '../utils/colors.dart';
import 'widgets/weather_items.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: contrastColor,
        appBar:
            CustomAppBar(color: contrastColor, title: 'Weather     ', body: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.sunny, color: Colors.amber, size: 100),
              Text('19C',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 30)),
            ],
          ),
          SizedBox(height: 30),
        ]),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, -2)),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WeatherItemOne(
                              parameter: 'Wind',
                              parameterIcon: Icons.air,
                              value: '30 km/h',
                              widget: Row(
                                children: [
                                  Icon(Icons.cloud_circle_outlined,
                                      color: mainColor, size: 18),
                                  const SizedBox(width: 5.0),
                                  const Text('no',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400))
                                ],
                              )),
                          const WeatherItemOne(
                              parameter: 'Wind',
                              value: '30 km/h',
                              widget: SizedBox()),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WeatherItemOne(
                              parameter: 'Wind',
                              parameterIcon: Icons.air,
                              value: '30 km/h',
                              widget: SizedBox()),
                          WeatherItemOne(
                              parameter: 'Wind',
                              parameterIcon: Icons.air,
                              value: '30 km/h',
                              widget: Text('Kunms uun',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400))),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherWidgetTwo(
                            parameter: 'Somewhere',
                            parameterIcon: Icons.cloud,
                            value: '28 C',
                            isSmall: false),
                        WeatherWidgetTwo(
                            parameter: 'Somewhere',
                            parameterIcon: Icons.circle,
                            value: '28 C',
                            isSmall: false),
                        WeatherWidgetTwo(
                            parameter: 'Somewhere',
                            parameterIcon: Icons.cloud,
                            value: '28 C',
                            isSmall: false),
                        WeatherWidgetTwo(
                            parameter: 'Somewhere',
                            parameterIcon: Icons.sunny,
                            value: '28 C',
                            isSmall: false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherWidgetTwo(
                            parameter: '20:00',
                            parameterIcon: Icons.circle,
                            value: '28 C',
                            isSmall: true),
                        WeatherWidgetTwo(
                            parameter: '20:00',
                            parameterIcon: Icons.circle,
                            value: '28 C',
                            isSmall: true),
                        WeatherWidgetTwo(
                            parameter: '20:00',
                            parameterIcon: Icons.circle,
                            value: '28 C',
                            isSmall: true),
                        WeatherWidgetTwo(
                            parameter: '20:00',
                            parameterIcon: Icons.circle,
                            value: '28 C',
                            isSmall: true),
                        WeatherWidgetTwo(
                            parameter: '20:00',
                            parameterIcon: Icons.circle,
                            value: '28 C',
                            isSmall: true),
                        WeatherWidgetTwo(
                            parameter: '20:00',
                            parameterIcon: Icons.cloud,
                            value: '28 C',
                            isSmall: true),
                        WeatherWidgetTwo(
                            parameter: '20:00',
                            parameterIcon: Icons.cloud,
                            value: '28 C',
                            isSmall: true),
                      ],
                    ),
                  ),
                  const Center(child: SizedBox(height: 50)),
                ],
              ),
            ),
          ),
        ));
  }
}
