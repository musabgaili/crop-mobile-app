import 'package:cropsense/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:cropsense/helpers/auth_helper.dart';
import 'package:cropsense/helpers/shared_pref_helper.dart';
import 'package:cropsense/utils/apis.dart';

// import 'dart:convert';

class FarmService {
  final String _baseUrl = '$baseURL/api/farms';

  final SharedPreHelper sharedPreHelper = SharedPreHelper();
  final ApiHelpers apiHelpers = ApiHelpers();
  final AuthHelper authHelper = AuthHelper();

  Future<http.Response> getFarms() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/'),
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
    );

    if (response.statusCode != 200) {
      // throw Exception('Failed to fetch records');
      // make snackbar notification using main.dart  snackbarkey
      snackbarKey.currentState
          ?.showSnackBar(const SnackBar(content: Text('Failed to fetch records')));
    }
    return response;
  }

  Future<http.Response> getSingleFarm(int id) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$id'),
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch records');
    }
    return response;
  }

  Future<http.Response> getFarmWeekSummary(int id) async {
    final response = await http.get(
      Uri.parse(
        '$baseURL/api/sensors/average/all/$id',
      ),
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
    );
    return response;
  }
}
