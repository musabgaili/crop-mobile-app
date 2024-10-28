import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class WeatherItemOne extends StatelessWidget {
  final String parameter;
  final IconData? parameterIcon;
  final String value;
  final Widget widget;
  const WeatherItemOne(
      {super.key,
      required this.parameter,
      this.parameterIcon,
      required this.value,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Center(
            child: Container(
                padding: const EdgeInsets.all(15.0),
                width: 170,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, -2)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(parameter,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                      const SizedBox(width: 10.0),
                      parameterIcon != null
                          ? Icon(parameterIcon!, size: 20, color: mainColor)
                          : const SizedBox()
                    ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey)),
                          widget
                        ])
                  ],
                ))));
  }
}

class WeatherWidgetTwo extends StatelessWidget {
  final String parameter;
  final IconData parameterIcon;
  final String value;
  final bool isSmall;
  const WeatherWidgetTwo(
      {super.key,
      required this.parameter,
      required this.parameterIcon,
      required this.value,
      required this.isSmall});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(isSmall ? 6.0 : 8.0),
          width: isSmall ? 67 : 120,
          height: isSmall ? 80 : 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, -2)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(parameter,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: contrastColor)),
              Icon(parameterIcon, color: Colors.amberAccent),
              Text(
                value,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: contrastColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
