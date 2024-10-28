
import 'package:cropsense/components/farm_item.dart';
import 'package:cropsense/farm_screens/farm_data_screen.dart';
import 'package:cropsense/providers/farm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../global_widgets/custom_appbar.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

class FarmersScreens extends ConsumerWidget {
  const FarmersScreens({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farms = ref.watch(farmNotifierProvider);

    return Scaffold(
      backgroundColor: contrastColor,
      appBar: CustomAppBar(
        color: contrastColor,
        image: farmer,
        body: [
          const Center(
            child: Text('Farms List',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 60),
          Container(
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: SizedBox(
              height: 600,
              child: Column(
                children: [
                  // CustomGridWidget(),
                  // CustomGridWidget(),
                  ...farms.farms!.map((farm) {
                    return FarmItem(
                      name: farm.name,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FarmDataScreen(
                              farm: farm,
                            ),
                            // builder: (context) => SoilMoisturePage(farmId: farms.farms![index].id, farmName: farms.farms![index].name,),
                          ),
                          // SoilMoisturePage
                        );
                      },
                    );
                  // ignore: unnecessary_to_list_in_spreads
                  }).toList(),
                ],
              )),
        ),
      ),
    );
  }
}
