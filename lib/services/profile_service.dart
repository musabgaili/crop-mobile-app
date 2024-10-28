import 'dart:convert';

import 'package:cropsense/helpers/auth_helper.dart';
import 'package:cropsense/helpers/shared_pref_helper.dart';
import 'package:cropsense/utils/apis.dart';
import 'package:http/http.dart' as http;

/// [class] responsible of login logout auth check only
class ProfileService {
  final api = '$baseURL/api/user';
  final SharedPreHelper sharedPreHelper = SharedPreHelper();
  final ApiHelpers apiHelpers = ApiHelpers();
  final AuthHelper authHelper = AuthHelper();

  Future<http.Response> submitData(data) async {
    final http.Response response = await http.post(
      Uri.parse("$api/update-profile"),
      body: jsonEncode(data),
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
    );

    return response;
  }

  Future<http.Response> updatePassword(data) async {
    final http.Response response = await http.post(
      Uri.parse("$api/update-password"),
      body: data,
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
    );

    return response;
  }

}
