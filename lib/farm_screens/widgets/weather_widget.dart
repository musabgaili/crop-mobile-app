import 'package:flutter/material.dart';
import '../../utils/colors.dart';

const Color textColor = Colors.white;

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            padding: const EdgeInsets.all(20.0),
            color: contrastColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    Row(
                      children: [
                        Text('19',
                            style: TextStyle(fontSize: 50, color: textColor)),
                        SizedBox(width: 10),
                        Icon(Icons.sunny, size: 50, color: Colors.amber),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
                Container(
                    width: 0.5,
                    color: textColor,
                    height: MediaQuery.of(context).size.width * 0.05),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherState(
                          icon: Icons.water_drop_outlined, text: "98%"),
                      SizedBox(width: 20),
                      WeatherState(icon: Icons.cloud, text: "0mm")
                    ])
              ],
            )),
      ),
    );
  }
}

class WeatherState extends StatelessWidget {
  final IconData icon;
  final String text;
  const WeatherState({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 25, color: textColor),
        const SizedBox(height: 15),
        Text(text, style: const TextStyle(color: textColor))
      ],
    );
  }
}
