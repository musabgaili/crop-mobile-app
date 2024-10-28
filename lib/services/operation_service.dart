
import 'package:cropsense/helpers/auth_helper.dart';
import 'package:cropsense/helpers/shared_pref_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cropsense/utils/apis.dart';

// OperationService class
class OperationService {
  final String _baseUrl = '$baseURL/api/operations';

  // OperationService();

  final SharedPreHelper sharedPreHelper = SharedPreHelper();
  final ApiHelpers apiHelpers = ApiHelpers();
  final AuthHelper authHelper = AuthHelper();

  /// Fetches a list of operations from the API.
  ///
  /// Returns a Future containing the list of operations.
  ///
  /// Throws an exception if the request fails.
  Future<http.Response> fetchOperations(int farmId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/history'),
      body: jsonEncode({"farm_id":farmId}),
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
    );

    return response;

    // if (response.statusCode == 200) {
    //   return jsonDecode(response.body)['operations'];
    // } else {
    //   throw Exception('Failed to load operations: ${response.statusCode}');
    // }
  }

  /// Creates a new operation in the API.
  ///
  /// Returns a Future containing the newly created operation.
  ///
  /// Throws an exception if the request fails.
  Future<http.Response> createOperation(Map<String, dynamic> data) async {
    // log(jsonEncode(data));
    final response = await http.post(
      Uri.parse('$_baseUrl/'),
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
      body: jsonEncode(data),
    );

    return response;
   
  }

  /// Updates an existing operation in the API.
  ///
  /// Returns a Future containing the updated operation.
  ///
  /// Throws an exception if the request fails.
  Future<http.Response> updateOperation(
      int operationId, Map<String, dynamic> data) async {
    final response = await http.put(Uri.parse('$_baseUrl/$operationId'),
        body: jsonEncode(data));

    return response;
   
  }
}
