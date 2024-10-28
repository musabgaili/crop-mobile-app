// import 'package:cropsense/archive/provider/tasks_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import '../models/task.dart';
// import '../utils/colors.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class TaskItem extends ConsumerWidget {
//   final Task task;

//   const TaskItem({super.key, required this.task});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     bool isCompleted = task.status == 1;

//     Future<void> showStatusMenu() async {
//       final int? newStatus = await showDialog<int>(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Select Status'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: const Text('Idle'),
//                 onTap: () => Navigator.pop(context, 1),
//               ),
//               ListTile(
//                 title: const Text('Processing'),
//                 onTap: () => Navigator.pop(context, 2),
//               ),
//               ListTile(
//                 title: const Text('Review'),
//                 onTap: () => Navigator.pop(context, 3),
//               ),
//               ListTile(
//                 title: const Text('Revise'),
//                 onTap: () => Navigator.pop(context, 4),
//               ),
//             ],
//           ),
//         ),
//       );

//       if (newStatus != null) {
//         // Show loading indicator while updating status
//         final statusUpdateProvider = FutureProvider<void>((ref) async {
//           final taskService = ref.read(taskServiceProvider);
//           await taskService.updateStatus(task.id.toString(), newStatus);
//         });

//         // Start the status update and wait for completion
//         await ref.read(statusUpdateProvider.future);
//         Future.delayed(const Duration(seconds: 10));
//         // Refresh the tasks provider to get the updated list
//         final updatedTasksAsyncValue = ref.refresh(fetchTasksProvider);

//         // Navigate to the TasksPage with updated tasks
//         updatedTasksAsyncValue.when(
//           data: (tasks) {
//             Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => TasksPage(tasks: tasks)));
//           },
//           loading: () => const Center(child: CircularProgressIndicator()),
//           error: (error, stackTrace) => Center(child: Text('Error: $error')),
//         );
//       }
//     }

//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         padding: const EdgeInsets.all(5.0),
//         height: 80,
//         decoration: BoxDecoration(
//           color: isCompleted ? contrastColor : mediumGreyColor,
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Icon(
//               isCompleted ? Icons.check_circle : Icons.circle_outlined,
//               size: 25,
//               color: isCompleted ? mainColor : Colors.grey,
//             ),
//             const SizedBox(width: 10.0),
//             Text('${task.title} (${task.id})'),
//             const SizedBox(width: 10.0),
//             GestureDetector(
//               onTap: showStatusMenu,
//               child: Text(
//                 task.status == 1 ? 'Idle' : 'Processing',
//               ),
//             ),
//             isCompleted
//                 ? Icon(Icons.check, size: 25, color: mainColor)
//                 : const Icon(Icons.close, size: 25, color: Colors.grey),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AddTask extends StatelessWidget {
//   const AddTask({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Container(
//             padding: const EdgeInsets.all(5.0),
//             height: 80,
//             decoration: BoxDecoration(
//                 color: mediumGreyColor,
//                 borderRadius: BorderRadius.circular(15.0)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.add_circle, size: 25, color: Colors.grey),
//                 SizedBox(width: 5),
//                 Text('Add Task', style: TextStyle(color: Colors.grey)),
//               ],
//             )));
//   }
// }

// class AddSuggestion extends StatelessWidget {
//   const AddSuggestion({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Container(
//             padding: const EdgeInsets.all(5.0),
//             height: 60,
//             decoration: BoxDecoration(
//                 color: mainColor, borderRadius: BorderRadius.circular(15.0)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: const [
//                 SizedBox(width: 17.0),
//                 Icon(Icons.assignment_add, size: 25, color: Colors.white),
//                 SizedBox(width: 5),
//                 Text('Add your Sugestions',
//                     style: TextStyle(color: Colors.white)),
//               ],
//             )));
//   }
// }

// class TaskProgress extends StatelessWidget {
//   const TaskProgress({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//         const SizedBox(
//             width: 100, child: Text('Completion Rate:', maxLines: 2)),
//         CircularPercentIndicator(
//           radius: 80.0,
//           lineWidth: 8.0,
//           percent: 0.75, // 75% complete
//           center: const Text(
//             "75%",
//             style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
//           ),
//           progressColor: mainColor,
//           backgroundColor: Colors.transparent,
//         ),
//       ]),
//     );
//   }
// }
