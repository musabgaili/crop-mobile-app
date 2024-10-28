// import 'package:cropsense/providers/single_task_provider.dart';
import 'package:cropsense/models/task.dart';
import 'package:cropsense/task_screens/widgets/task_status_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../global_widgets/colored_button.dart';
import '../utils/colors.dart';
import '../global_widgets/custom_appbar.dart';

// ignore: must_be_immutable
class TaskDetailScreen extends ConsumerWidget {
  TaskDetailScreen({super.key, required this.task});
  Task task;

 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final taskProvider = ref.watch(singleTaskNotifierProvider(task));
    return Scaffold(
        floatingActionButton:
            ColoredButton(color: contrastColor, text: 'Done', onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: mainColor,
        appBar: CustomAppBar(
          title: 'Details',
          color: mainColor,
          actions: const [Icon(Icons.more_vert)],
          body: [
            TextColumn(isColored: false, title: '', subtitle: task.title),
            Container(
                color: Colors.white,
                height: 0.5,
                width: MediaQuery.of(context).size.width * 0.85),
            const SizedBox(height: 20),
            TextColumn(
                isColored: false,
                title: 'Due Date',
                subtitle: task.dueDate.toString()),
            Container(
                color: Colors.white,
                height: 0.5,
                width: MediaQuery.of(context).size.width * 0.85),
            const SizedBox(height: 10),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      TextColumn(
                          isColored: true,
                          title: 'Creation Time',
                          subtitle: task.createdAt.toString()),
                      const Spacer(),
                      // TextColumn(
                      //     isColored: true,
                      //     title: 'End Time',
                      //     subtitle: task.dueDate.toString())
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      SizedBox(width: 30),
                      Text(
                  'Task Discription',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.1 ),
                  SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.15,
                    child: Text(
                      task.description!,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     const SizedBox(width: 30),
                  //     Icon(Icons.image, color: contrastColor),
                  //     Icon(Icons.add_comment_sharp, color: contrastColor),
                  //   ],
                  // ),
                  Center(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25)),

                  const SizedBox(height: 10),

                  // Container(
                  //   width: 100,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       color: contrastColor),
                  //   child:
                  // ),

                  StatusDropdown(task:task),
                ],
              ),
            ),
          ),
        ));
  }
}

class TextColumn extends StatelessWidget {
  final bool isColored;
  final String title;
  final String subtitle;
  const TextColumn(
      {super.key,
      required this.isColored,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: isColored ? Colors.black : Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 10),
          Text(subtitle,
              style: TextStyle(
                  color: isColored ? mainColor : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
