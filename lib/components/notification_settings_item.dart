// import 'package:flutter/material.dart';
// import '../utils/colors.dart';
// import 'custom_switch.dart';

// class NotificationSettingItem extends StatelessWidget {
//   final bool isNew;
//   final String keyName;
//   const NotificationSettingItem(
//       {super.key, required this.isNew, required this.keyName});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
//       child: Center(
//         child: Container(
//           height: 60,
//           width: MediaQuery.of(context).size.width * 0.9,
//           decoration: BoxDecoration(
//               color: mediumGreyColor,
//               borderRadius: BorderRadius.circular(15.0)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(width: 17.0),
//               SizedBox(
//                   width: 300,
//                   child: Text(keyName,
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: isNew ? Colors.white : contrastColor))),
//               CustomSwitch(keyName: keyName),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NotificationPreferencesItem extends StatelessWidget {
//   final bool isTrue;
//   final String keyName;
//   final IconData icon;
//   const NotificationPreferencesItem(
//       {super.key,
//       required this.isTrue,
//       required this.keyName,
//       required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//       child: Center(
//         child: Container(
//           height: 60,
//           width: MediaQuery.of(context).size.width * 0.9,
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(width: 17.0),
//               Icon(icon, size: 25, color: contrastColor),
//               const SizedBox(width: 17.0),
//               SizedBox(
//                   width: 250,
//                   child: Text(keyName,
//                       style: TextStyle(fontSize: 15, color: contrastColor))),
//               CustomSwitch(keyName: keyName),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
