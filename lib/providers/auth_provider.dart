import 'dart:convert';
import 'dart:developer';

import 'package:cropsense/helpers/shared_pref_helper.dart';
import 'package:cropsense/home_screens/navigation_screen.dart';
import 'package:cropsense/main.dart';
import 'package:cropsense/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationNotifier extends ChangeNotifier {
  AuthenticationNotifier(this.ref);
  AuthService authService = AuthService();
  SharedPreHelper sharedPreHelper = SharedPreHelper();
  Ref ref;
  bool isLoading = false;
  login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    await authService.login(email, password).then((response) async {
      // if response is ok save token using shared preferences helper , then navigate to home screen
      log("Login Response  : ${response.body}");
      try {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final token = data['token'];
          await sharedPreHelper.setUserToken(token);
          // navigate to home screen
          navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(builder: (context) => const NavigationScreen()),
          );
        } else {
          // snakbar telling user that the email or password is incorrect
          errorSnackBar('Email or password is incorrect');
        }
      } catch (e) {
        errorSnackBar("An error occurred");
      }
      // set loading to false
      isLoading = false;
      notifyListeners();
    });
  }

  errorSnackBar(String message) {
    snackbarKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}

final authProvider = ChangeNotifierProvider<AuthenticationNotifier>(
  (ref) => AuthenticationNotifier(ref),
);
