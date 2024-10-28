// import 'dart:developer';

// import 'package:cropsense/main.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class CustomHelpers {
// globaltextValidator(value, {String message = 'please fill the field'}) {
//   if (value!.isEmpty) return message.tr();
//   return null;
// }
// }

// navigatorHelper({required Widget screen}) {
//   navigatorKey.currentState?.push(
//     MaterialPageRoute(builder: (context) => screen),
//   );
// }

// navigatorHelper2({required Widget screen}) {
//   // navigatorKey.currentState?.push(
//   //   MaterialPageRoute(builder: (context) => screen),
//   // );

//   log(navigatorKey.currentWidget.toString());
// }

// class LanguageHelper {
//   const LanguageHelper();
//   // final BuildContext context;
//   changeLangugae(BuildContext context) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     // var locale = await prefs.setString('locale', 'en');
//     var locale = prefs.getString('locale');
//     if (locale == 'en' || locale == null) {
//       await prefs.setString('locale', 'ar');
//       if (!context.mounted) {
//         log('not mounted , ignore');
//         return;
//       }
//       log('arabic');
//      await context.setLocale(
//         const Locale('ar'),
//       );
//     } else {
//       await prefs.setString('locale', 'en');
//       if (!context.mounted) return;
//       log('engilz');

//      await context.setLocale(
//         const Locale('en'),
//       );
//     }
//   }
// }
