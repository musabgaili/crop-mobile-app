import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/apis.dart';

final authProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  final String _baseUrl = '$baseURL/api/auth';
  static const _tokenKey = 'auth_token';
  static const _groupId = 'farm_group_Id';

  // Register method
  Future<String?> register(String name, String email, String phone, String type,
      String password, String passwordConfirmation) async {
    final response = await http.post(Uri.parse('$_baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
    'name': name,
    'email': email,
    'phone': phone,
    'type': type,
    'password': password,
    'password_confirmation': passwordConfirmation,
        }));

    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      final groupID = data['user']['farm_group_id'];
      await _saveToken(token);
      await _saveGroupId(groupID);
      return token;
    } else {
      return null;
    }
  }

  Future<String?> login(String email, String password) async {
    log(email + password);
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      log( "response is ${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        await _saveToken(token);
        return token;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }

  Future<void> logout() async {
    await _clearToken();
  }

  Future<bool> get isAuthenticated async {
    final token = await getToken();
    return token != null;
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<void> _saveGroupId(int groupId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_groupId, groupId);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<int?> getGroupId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_groupId);
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
