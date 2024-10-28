
import 'package:cropsense/providers/tasks_provider.dart';
import 'package:cropsense/task_screens/tasks_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/colors.dart';

class TasksDetailWidget extends ConsumerStatefulWidget {
  const TasksDetailWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TasksDetailWidgetState();
}

class _TasksDetailWidgetState extends ConsumerState<TasksDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskNotifierProvider);
    // final updatedTasksAsyncValue = ref.refresh(fetchTasksProvider);

    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: contrastColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  const Icon(Icons.message_rounded, color: Colors.white),
                  const SizedBox(width: 10),
                  const Text(
              'Tasks',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TaskManagementScreen(),
                          ));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                  'See All',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              tasks.isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: tasks.todayTasks!.isEmpty
                          ? [
                              const Center(
                                child: Text(
                                  "No Tasks Due Today",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]
                          : tasks.todayTasks!
                              .take(4)
                              .map(
                                (task) => InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    height: 20,
                                    // color: Colors.white,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Text(
                                      task.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
          
              const SizedBox(height: 30),
              SizedBox(
                  height: 20,
                  // color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.8),
              const SizedBox(height: 30),
              SizedBox(
                  height: 20,
                  // color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.8),
              // const SizedBox(height: 40),
            ],
          )),
    );
  }
}
