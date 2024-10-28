import '../utils/colors.dart';
import 'package:flutter/material.dart';
import '../models/crop.dart';
import '../utils/icons.dart';

class CropItem extends StatelessWidget {
  final Crop crop;
  const CropItem({super.key, required this.crop});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: contrastColor)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  farmer,
                  height: 180.0,
                  width: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(crop.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800)),
                            const SizedBox(height: 5),
                            Text("Quantity: ${crop.quantity}",
                                style: const TextStyle(fontSize: 12)),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("price: \$${crop.price}",
                                      style: const TextStyle(fontSize: 12)),
                                  Text(crop.date,
                                      style: const TextStyle(fontSize: 12))
                                ]),
                          ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
