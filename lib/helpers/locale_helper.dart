// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:easy_localization/easy_localization.dart';

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
//       context.setLocale(
//         const Locale('ar'),
//       );
//     } else {
//       await prefs.setString('locale', 'en');
//       if (!context.mounted) return;
//       context.setLocale(
//         const Locale('en'),
//       );
//     }
//   }
// }
