
import 'package:cropsense/helpers/auth_helper.dart';
import 'package:cropsense/helpers/shared_pref_helper.dart';
import 'package:http/http.dart' as http;
import 'package:cropsense/utils/apis.dart';

// NotificationService class
class NotificationService {
  final String _baseUrl = '$baseURL/api/notifications';

  // NotificationService();

  final SharedPreHelper sharedPreHelper = SharedPreHelper();
  final ApiHelpers apiHelpers = ApiHelpers();
  final AuthHelper authHelper = AuthHelper();

  /// Fetches a list of notification from the API.
  ///
  /// Returns a Future containing the list of notification.
  ///
  /// Throws an exception if the request fails.
  Future<http.Response> fetchNotifications() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/history'),
      headers: apiHelpers.apiHeaders(
        await sharedPreHelper.getUserToken(),
      ),
    );

    return response;

    // if (response.statusCode == 200) {
    //   return jsonDecode(response.body)['notification'];
    // } else {
    //   throw Exception('Failed to load notification: ${response.statusCode}');
    // }
  }

}
