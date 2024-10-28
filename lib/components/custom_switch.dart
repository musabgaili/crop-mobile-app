// import '../utils/colors.dart';
// import 'package:flutter/material.dart';


// class CustomSwitch extends StatefulWidget {
//   final String keyName;

//   const CustomSwitch({
//     super.key,
//     required this.keyName,
//   });

//   @override
//   State<CustomSwitch> createState() => _CustomSwitchState();
// }

// class _CustomSwitchState extends State<CustomSwitch> {
//   bool _isSwitchOn = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSwitchState();
//   }

//   Future<void> _loadSwitchState() async {
//     _isSwitchOn = await CacheHelper.getSwitchState(widget.keyName);
//     setState(() {});
//   }

//   Future<void> _saveSwitchState(bool value) async {
//     await CacheHelper.saveSwitchState(widget.keyName, value);
//   }

//   void _onSwitchChanged(bool value) {
//     setState(() {
//       _isSwitchOn = value;
//     });
//     _saveSwitchState(value); // Save preferences after state change
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 40,
//       height: 22,
//       decoration: BoxDecoration(
//           border: Border.all(width: 1),
//           borderRadius: BorderRadius.circular(15)),
//       child: Switch(
//         value: _isSwitchOn,
//         onChanged: _onSwitchChanged,
//         activeColor: mainColor,
//         inactiveThumbColor: contrastColor,
//         inactiveTrackColor: Colors.transparent,
//         activeTrackColor: Colors.transparent,
//         // mainColor.withOpacity(0.5),
//       ),
//     );
//   }
// }
