import 'dart:convert';

import 'package:cropsense/models/farm.dart';
import 'package:cropsense/models/operation.dart';
import 'package:cropsense/services/operation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OperationNotifier extends ChangeNotifier {
  List operationTypes = ['fertilizer', 'pesticide', 'irrigation'];

  OperationNotifier(this.ref, this.farm) {
    getOperationsData();
  }

  Ref ref;
  Farm farm;

  bool isLoading = false;

  OperationService operationService = OperationService();
  List<Operation> operations = List.empty(growable: true);
  getOperationsData() async {
    isLoading = true;
    operationService.fetchOperations(farm.id).then((value) {
      Iterable data = jsonDecode(value.body)['operations'];
      operations = data.map((e) => Operation.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    });
  }
}

final opeartionsProvider = ChangeNotifierProvider.autoDispose
    .family<OperationNotifier, Farm>((ref, Farm farm) {
  return OperationNotifier(ref, farm);
});
