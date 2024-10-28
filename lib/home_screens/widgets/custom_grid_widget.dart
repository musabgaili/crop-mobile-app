
import 'package:cropsense/components/farm_item.dart';
import 'package:cropsense/farm_screens/farm_data_screen.dart';
import 'package:cropsense/models/farm.dart';
import 'package:cropsense/providers/farm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';

class CustomGridWidget extends StatelessWidget {
  const CustomGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlockWidget(),
            BlockWidget(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlockWidget(),
            BlockWidget(),
          ],
        )
      ],
    );
  }
}

class BlockWidget extends StatelessWidget {
  const BlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FarmDataScreen(
                farm: Farm(
                    id: 1,
                    farmGroupId: 1,
                    name: 'name',
                    location: 'location',
                    size: 1,
                    cropType: 'cropType',
                    description: 'description',
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now()),
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: 170,
          height: 100,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(farmer),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: mainColor),
                width: 50,
                height: 20,
                child: const Center(
                  child: Text('name',
                      style: TextStyle(color: Colors.white, fontSize: 11)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGridWidget2 extends ConsumerWidget {
  const CustomGridWidget2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farms = ref.watch(farmNotifierProvider);

    return Column(
      children: [
        if (farms.isLoading)
          const Center(
            child: CircularProgressIndicator(),
          )
        else
          Container(
              padding: const EdgeInsets.all(8),
              height: 600,
              child: Column(
                children: farms.farms!.take(4).map((farm) {
                  return FarmItem(
                    name: farm.name,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FarmDataScreen(
                            farm: farm,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              )),
      ],
    );
  }
}
