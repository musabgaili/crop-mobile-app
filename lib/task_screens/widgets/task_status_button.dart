import 'dart:developer';

import 'package:cropsense/models/task.dart';
import 'package:cropsense/providers/single_task_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusDropdown extends ConsumerStatefulWidget {
  const StatusDropdown({super.key, 
    required this.task,
  });
  final Task task;

  @override
  StatusDropdownState createState() => StatusDropdownState();
}

class StatusDropdownState extends ConsumerState<StatusDropdown> {
  String selectedStatus = 'Idle';

  @override
  Widget build(BuildContext context) {
    final taskProvider = ref.watch(singleTaskNotifierProvider(widget.task));
    // selectedStatus = tas

    return Container(
      width: MediaQuery.of(context).size.width *
          0.9, // Adjust the width to fit the screen
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(30.0), // Circular border
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: taskStatusConverterNumToStr(widget.task.status!),
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          isExpanded: true, // Make the dropdown button take up the full width
          style: const TextStyle(color: Colors.blue, fontSize: 18),
          onChanged: (String? newValue) {
            if (statusConverter(widget.task.status!) == newValue) {
              log(('${statusConverter(widget.task.status!)}  $newValue'));
            } else {
              setState(() {
                // selectedStatus = newValue!;
                log('changing');
                taskProvider.updateTask(
                    widget.task.id, statusConverter(newValue));
              });
            }
          },
          items: <String>['Idle', 'Working', 'Complete', 'Revise']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

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

taskStatusConverterNumToStr(int statusId) {
  String? status;
  switch (statusId) {
    case 0:
      status = 'Idle';
      break;
    case 1:
      status = 'Working';
      break;
    case 2:
      status = 'Complete';
      break;
    case 3:
      status = 'Revise';
      break;
  }
  return status;
}
