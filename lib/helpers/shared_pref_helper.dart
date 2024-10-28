import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreHelper {
  /// The function retrieves a token from shared preferences in a Flutter/Dart application.
  /// Returns:
  ///   The `getToken()` function is returning a [Future] that resolves to a `String` value representing
  /// the token retrieved from the `SharedPreferences` instance.

  Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    // log('Hi Token IS $token');
    return token;
  }

  /// this functions save auth_token in shared prefernces
  /// then calls getUserToken() function to retrive the token
  setUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', token);
    return await getUserToken();
  }

  /// this functions save auth_token in shared prefernces
  /// then calls getUserToken() function to retrive the token
  Future<bool> deleteUserToken() async {
    log('out');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('user_data');
    return prefs.remove('auth_token');
  }
  //

  setTeamAndUser(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var sharedData = json.decode(data);
    var user = sharedData['user'];

    prefs.setString('user_data', jsonEncode(user));

    return await getTeamAndUser();
  }

  Future<dynamic> getTeamAndUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('user_data');
    return {
'user': user != null ? jsonDecode(user) : null,
    };
  }

  setUser(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // var sharedData = json.decode(data);
    var user = data;
    prefs.setString('user_data', jsonEncode(user));
  }

}
