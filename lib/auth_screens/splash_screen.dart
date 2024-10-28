import 'dart:async';
import 'dart:developer';


import 'package:cropsense/auth_screens/login_screen.dart';
import 'package:cropsense/home_screens/navigation_screen.dart';
import 'package:cropsense/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/icons.dart';
import 'widgets/logo.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final authService = ref.read(authProvider);
    final isLoggedIn = await authService.isAuthenticated;
    log(isLoggedIn.toString());

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            if (isLoggedIn) {
              return const NavigationScreen();
            } else {
              return const LoginScreen();
            }
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(farmer, fit: BoxFit.fitHeight)),
            const Center(child: Logo(isColored: false))
          ],
        ));
  }
}

