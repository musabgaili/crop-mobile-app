import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weekly_data.dart';
import '../utils/apis.dart';

const String _baseUrl = '$baseURL/api/sensors/average/all';
// Define the provider
final weeklyDataProvider = FutureProvider<WeeklyData>((ref) async {
  const id = '14';
  final response = await http.get(Uri.parse('$_baseUrl/$id'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> json = jsonDecode(response.body);
    // print(json);
    return WeeklyData.fromJson(json);
  } else {
    // print(response.statusCode);
    throw Exception('Failed to load data');
  }
});
