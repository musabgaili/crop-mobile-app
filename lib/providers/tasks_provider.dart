import 'dart:developer';

import 'package:cropsense/main.dart';
import 'package:cropsense/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/apis.dart'; // Make sure this points to the correct API base URL
 import '../models/task.dart';
import 'auth.dart'; // Import the Task model

// TaskService class
class TaskServiceE {
  final AuthService _authService;
  final String _baseUrl = '$baseURL/api/tasks';

  TaskServiceE(this._authService);

  // Helper method to get authorization headers
  Future<Map<String, String>> _authHeaders() async {
    final token = await _authService.getToken();
    return {
'Content-Type': 'application/json',
'Authorization': 'Bearer $token',
    };
  }

  // Method to store a new task
  Future<void> storeTask(Task task) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/store'), // Ensure the URL endpoint is correct
      headers: await _authHeaders(),
      body: jsonEncode(task.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create task');
    }
  }

  // Fetch tasks assigned to the current user and tasks due today
  Future<List<Task>> fetchTasks() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/'),
      headers: await _authHeaders(),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> assignedTasksJson = data['assigned_tasks'];

      return assignedTasksJson.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  // Update task status
  Future<void> updateStatus(String taskId, int status) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/update-status/$taskId'),
      headers: await _authHeaders(),
      body: jsonEncode({'status': status}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task status');
    }
  }

  // Send revision request
  Future<void> sendRevisionRequest(String taskId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/revision-request'),
      headers: await _authHeaders(),
      body: jsonEncode({'task_id': taskId}),
    );

    if (response.statusCode != 200) {
      log('failed to revise ${response.statusCode}');
      // throw Exception('Failed to send revision request');
      snackbarKey.currentState!.showSnackBar(const SnackBar(content: Text('Failed to send revision request')));

    }
  }
}

// Provider for TaskService
final taskServiceProvider = Provider<TaskServiceE>((ref) {
  final authService = ref.read(authProvider);
  return TaskServiceE(authService);
});

// Provider to store a task
final storeTaskProvider = FutureProvider.family<void, Task>((ref, task) async {
  final taskService = ref.read(taskServiceProvider);
  await taskService.storeTask(task);
});

// Providers for TaskService methods
final fetchTasksProvider = FutureProvider<List<Task>>((ref) async {
  final taskService = ref.read(taskServiceProvider);
  // log('Its Here' + await taskService.fetchTasks().len);

  return await taskService.fetchTasks();
});

// Provider for updating task status
final updateTaskStatusProvider =
    FutureProvider.family<void, Map<String, dynamic>>((ref, data) async {
  final taskService = ref.read(taskServiceProvider);
  await taskService.updateStatus(data['taskId'], data['status']);
});

// Provider to request task revision
final sendRevisionRequestProvider =
    FutureProvider.family<void, String>((ref, taskId) async {
  final taskService = ref.read(taskServiceProvider);
  await taskService.sendRevisionRequest(taskId);
});

// Change Notifier TaskProvider

class TaskNotifier extends ChangeNotifier {
  TaskService taskService = TaskService();
  TaskNotifier(this.ref) {
    // TaskService();
    fetchTasks();
  }
  Ref ref;
  bool isLoading = false;

  List<Task>? tasks = List.empty(growable: true);
  List<Task>? todayTasks = List.empty(growable: true);

  fetchTasks() async {
      // log('error Happened');

    isLoading =true;
    notifyListeners();
    await taskService.fetchTasks().then((value) {
      var response = jsonDecode(value.body);
      // log(response.toString());
      Iterable taskResponse = response['assigned_tasks'];
      Iterable todayTaskResponse = response['today_tasks'];
      tasks = taskResponse.map((e) => Task.fromJson(e)).toList();
      todayTasks = todayTaskResponse.map((e) => Task.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    }).catchError((onError){
      log('error Happened ::$onError' );
    });
  }
}

final taskNotifierProvider = ChangeNotifierProvider<TaskNotifier>((ref) {
  return TaskNotifier(ref);
});
