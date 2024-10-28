// import 'package:cropsense/archive/provider/tasks_provider.dart';
import 'package:cropsense/models/task.dart';
import 'package:cropsense/providers/tasks_provider.dart';
import 'package:cropsense/task_screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/colors.dart';
import '../global_widgets/custom_appbar.dart';
import 'widgets/task_item.dart';

class TaskManagementScreen extends ConsumerWidget {
  const TaskManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskNotifierProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: contrastColor,
          appBar: CustomAppBar(
              color: contrastColor,
              title: 'Tasks Management',
              body: [
                Column(
                  children: [
                    TabBar(
                      indicatorColor: mainColor,
                      tabs: [
                        WeekdayDateWidget(
                            day: 'Today',
                            date: tasks.todayTasks!.length.toString(),
                            isToday: false),
                        WeekdayDateWidget(
                            day: 'Assinged Tasks',
                            date: tasks.tasks!.length.toString(),
                            isToday: false),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ],
                )
              ]),
          body: TabBarView(
            children: [
              // TOday Tasks
              TaskListWidget(
                tasks: tasks.todayTasks,
              ),
              // Assigned Tasks
              TaskListWidget(
                tasks: tasks.tasks,
              ),
              // Container(
              //   color: Colors.red,
              //   child: const Text("2"),
              // )
            ],
          )),
    );
  }
}

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key, required this.tasks});
  final List<Task>? tasks;

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, -2)),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  const Text(
                    'Tasks',
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),
              ...widget.tasks!.map(
                (task) => Column(
                  children: [
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return TaskDetailScreen(
                              task: task,
                            );
                          }),
                        );
                      },
                      child: TaskItem(task: task),
                    ),
                  ],
                ),
              ),
              Center(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3)),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class WeekdayDateWidget extends StatelessWidget {
  final String day;
  final String date;
  final bool isToday;
  const WeekdayDateWidget(
      {super.key,
      required this.day,
      required this.date,
      required this.isToday});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: mainColor.withOpacity(isToday ? 0.2 : 0.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day,
              style: TextStyle(
                  color: isToday ? mainColor : Colors.white, fontSize: 13)),
          Text(date,
              style: TextStyle(
                  color: isToday ? mainColor : Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 11)),
        ],
      ),
    );
  }
}
