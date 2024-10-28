import '../../utils/colors.dart';
import '../icon_customized.dart';
import '../../utils/icons.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItem(
                    icon: categoriesList[0].icon,
                    name: categoriesList[0].name,
                    color: mainColor),
                CategoryItem(
                    icon: categoriesList[1].icon,
                    name: categoriesList[1].name,
                    color: contrastColor),
                CategoryItem(
                    icon: categoriesList[2].icon,
                    name: categoriesList[2].name,
                    color: contrastColorTrans),
              ],
            )),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final String icon;
  final Color color;
  const CategoryItem(
      {super.key, required this.name, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
              height: 140,
              width: 120,
              padding: const EdgeInsets.all(15.0),
              color: color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconCustomized(height: 40, iconName: icon),
                  Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 20.0, 0.0, 0.0),
                      child: Text(name,
                          maxLines: 2,
                          style: const TextStyle(color: Colors.white)))
                ],
              ))),
    );
  }
}
