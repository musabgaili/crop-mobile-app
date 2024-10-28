import 'package:cropsense/models/task.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, -2)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: mainColor),
                      child: const Icon(Icons.list_alt_rounded,
                          color: Colors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task.title, style: const TextStyle(fontSize: 13)),
                        Text(task.dueDate.toString(),
                            style: const TextStyle(color: Colors.grey, fontSize: 11)),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: contrastColor),
                      child:  Center(
                          child: Text(taskStatusConverter(task.status!),
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.white))),
                    ),
                  ]),
            )));
  }
}

taskStatusConverter(int statusId){
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