import 'package:cropsense/auth_screens/splash_screen.dart';
import 'package:cropsense/helpers/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

SharedPreHelper sharedPreHelper = SharedPreHelper();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: snackbarKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Cropsense',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: "Ubuntu"),
      // home: const NavigationScreen());
      home: const SplashScreen(),
    );
  }
}
