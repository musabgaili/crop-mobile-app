import 'dart:convert';
import 'dart:developer';

import 'package:cropsense/providers/tasks_provider.dart';
import 'package:cropsense/main.dart';
import 'package:cropsense/models/task.dart';
import 'package:cropsense/services/task_service.dart';
// import 'package:cropsense/services/operation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingleTaskNotifier extends ChangeNotifier {
  TaskService taskService = TaskService();
  SingleTaskNotifier(this.ref, this.task) {
    // TaskService();
    // fetchTasks();
  }
  Ref ref;
  bool isLoading = false;
  Task? task;

  // fetchTask(id) async {
  //     // log('error Happened');

  //   isLoading =true;
  //   notifyListeners();
  //   await taskService.fetchTasks().then((value) {
  //     var response = jsonDecode(value.body);
  //     log(response.toString());
  //     Iterable taskResponse = response['assigned_tasks'];
  //     Iterable todayTaskResponse = response['today_tasks'];
  //     tasks = taskResponse.map((e) => Task.fromJson(e)).toList();
  //     todayTasks = todayTaskResponse.map((e) => Task.fromJson(e)).toList();
  //     isLoading = false;
  //     notifyListeners();
  //   }).catchError((onError){
  //     log('error Happened ::' +onError.toString() );
  //   });
  // }

  updateTask(id, status) async {
    log( "Task Status : ${status.toString()}  ${id.toString()}");
    await taskService.updateStatus(id.toString(), status).then((value) {
      log(value.body);

      if (jsonDecode(value.body)['success'] == 'task updated') {
        task!.status = status;
        Task? sameTask;
        sameTask = ref
            .read(taskNotifierProvider)
            .tasks!
            .where((element) => element.id == id)
            .firstOrNull;
        if (sameTask == null) {
           sameTask = ref
              .read(taskNotifierProvider)
              .todayTasks!
              .where((element) => element.id == id)
              .firstOrNull;
        }
        sameTask!.status = status;
        notifyListeners();
        return snackbarKey.currentState!
            .showSnackBar(const SnackBar(content: Text('task updated')));
      }
    });
  }

  ///
  ///
  ///
  statusConverter(statusString) {
    int? status;
    switch (statusString) {
      case 'Idle':
        status = 0;
        break;
      case 'Working':
        status = 1;
        break;
      case 'Complete':
        status = 2;
        break;
      case 'Revise':
        status = 3;
        break;
    }
    return status;
  }
}

final singleTaskNotifierProvider =
    ChangeNotifierProvider.family<SingleTaskNotifier, Task>((ref, Task task) {
  return SingleTaskNotifier(ref, task);
});
