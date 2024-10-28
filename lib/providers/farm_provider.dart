import 'dart:convert';
import 'dart:developer';

import 'package:cropsense/models/farm.dart';
import 'package:cropsense/models/weekly_data.dart';
import 'package:cropsense/services/farm_service.dart';
import 'package:cropsense/services/operation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmsNotifier extends ChangeNotifier {
  FarmsNotifier(this.ref) {
    getAllFarms();
  }
  FarmService farmService = FarmService();

  Ref ref;
  bool isLoading = false;

  List<Farm>? farms = List.empty(growable: true);

  getAllFarms() async {
    isLoading = true;

    await farmService.getFarms().then((value) {
      var response = jsonDecode(value.body);
      Iterable farmResponse = response['farms'];
      farms = farmResponse.map((e) => Farm.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    });
  }
}

final farmNotifierProvider = ChangeNotifierProvider<FarmsNotifier>((ref) {
  return FarmsNotifier(ref);
});

class SingleFarmNotifier extends ChangeNotifier {
  List operationTypes = ['fertilizer', 'pesticide', 'irrigation'];
  String type = 'fertilizer';

  SingleFarmNotifier(this.ref, this.farm) {
    getFarmData();

    // var x = jsonDecode(farm.points!);
    // log("Starting Point : ${x[0].toString()}");
    getFarmLocation();
  }

  Ref ref;
  Farm farm;
  FarmService farmService = FarmService();
  WeeklyData? weeklyData;

  bool isLoading = false;
  selectType(String value) {
    type = value;
    notifyListeners();
  }

  getFarmData() async {
    // log('message');
    getFarmWeekSummary();
  }

  getFarmWeekSummary() async {
    isLoading = true;
    await farmService.getFarmWeekSummary(farm.id).then((value) {
      final json = jsonDecode(value.body);
      try {
        weeklyData = WeeklyData.fromJson(json);
        // log("Weekly Data : ${weeklyData!.temperatures.toString()}");
      } catch (e) {
        // log(" Damn This Error : $e");
        weeklyData = WeeklyData(
          temperatures: [],
          humidities: [],
          lights: [],
          soilMoistures: [],
          tds: [],
        );
      }

      isLoading = false;
      notifyListeners();
    });
  }


  List<double> farmLocation = [];
  // get the current location of the farm using the points
  getFarmLocation() async {
    // if the points is not empty
    if (farm.points != null) {
      var x = jsonDecode(farm.points!);
      log("Starting Point : ${x[0].toString()}");
    // the points shape a polygon of the farm
    // use the polygon to get the center of the farm
    // use the center lattitude and longitude to get the weather data from the weather api
    List<double> lats = [];
    List<double> longs = [];
    for (var point in x) {
      lats.add(point[0]);
      longs.add(point[1]);
    }
    
    double centerLat = lats.reduce((a, b) => a + b) / lats.length;
    double centerLong = longs.reduce((a, b) => a + b) / longs.length;
    
    log("Center of farm: Lat $centerLat, Long $centerLong");
    farmLocation = [centerLat, centerLong];
    notifyListeners();
    // weather api will be called in another part of the app
    // here only setting the center of the farm


    }
    else {
      // if the points is empty use lat and long of Riyadh in Saudi Arabia
      farmLocation = [24.7136, 46.6753];
      notifyListeners();
    }
  }

  TextEditingController fertilizerController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  OperationService operationService = OperationService();
  registerOperation() async {
    if (formKey.currentState!.validate()) {
      // log('message');
      var data = {
        "type": type,
        "quantity": quantityController.text,
        "area": areaController.text,
        "farm_id": farm.id,
      };

      log(jsonEncode(data));
      // return;

      operationService.createOperation(data).then((value) {
        log(value.body);
      });
    }
  }
}

final singleFarmProvider = ChangeNotifierProvider.autoDispose
    .family<SingleFarmNotifier, Farm>((ref, Farm farm) {
  return SingleFarmNotifier(ref, farm);
});
