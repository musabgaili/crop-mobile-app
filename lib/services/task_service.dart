
import 'dart:developer';

import 'package:cropsense/helpers/auth_helper.dart';
import 'package:cropsense/helpers/shared_pref_helper.dart';
import 'package:cropsense/main.dart';
import 'package:cropsense/models/task.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cropsense/utils/apis.dart';

// TaskService class
class TaskService {
  // final AuthService _authService;
  final String _baseUrl = '$baseURL/api/tasks';

  final SharedPreHelper sharedPreHelper = SharedPreHelper();
  final ApiHelpers apiHelpers = ApiHelpers();
  final AuthHelper authHelper = AuthHelper();

  // TaskService();

  // Helper method to get authorization headers
  // Future<Map<String, String>> _authHeaders() async {
  //   // final token = await _authService.getToken();
  //   return {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   };
  // }

  // Method to store a new task
  Future<void> storeTask(Task task) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/store'), // Ensure the URL endpoint is correct
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
      body: jsonEncode(task.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create task');
    }
  }

  // Fetch tasks assigned to the current user and tasks due today
  Future<http.Response> fetchTasks() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/'),
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
    );

    return response;

    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body);
    //   final List<dynamic> assignedTasksJson = data['assigned_tasks'];

    //   return assignedTasksJson.map((json) => Task.fromJson(json)).toList();
    // } else {
    //   throw Exception('Failed to load tasks');
    // }
  }

  // Update task status
  Future<http.Response> updateStatus(String taskId, int status) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/update-status/$taskId'),
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
      body: {"status":status.toString()}
    );

    // if (response.statusCode != 200) {
    //   throw Exception('Failed to update task status');
    // }
    return response;
  }

  // Send revision request
  Future<void> sendRevisionRequest(String taskId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/revision-request'),
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
      body: jsonEncode({'task_id': taskId}),
    );

    if (response.statusCode != 200) {
      log('failed to revise ${response.statusCode}');
      // throw Exception('Failed to send revision request');
      snackbarKey.currentState!.showSnackBar(const SnackBar(content: Text('Failed to send revision request')));
    }
  }
}
