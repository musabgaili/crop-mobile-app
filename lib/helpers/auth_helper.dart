import 'dart:convert';

import 'package:cropsense/helpers/shared_pref_helper.dart';
import 'package:cropsense/main.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

class AuthHelper {
  loginRegisterHelper(Response response) {
    /// if [User] not_authenticated
    if (response.statusCode == 401) {
      return {'code': 401, 'msg': 'not_authenticated'};
    }

    /// if [User] not_authorized
    else if (response.statusCode == 403) {
      return {'code': 403, 'msg': 'not_authorized'};
    }

    /// if [Response] is_success
    else if (response.statusCode == 200) {
      var token = jsonDecode(response.body)['access_token'];

      /// if [Response_token] is_exist
      if (token != null) {
        SharedPreHelper().setUserToken(token);
        return {'code': 200, 'msg': 'success'};
      } else {
        /// if [Response_token] is_not_exist

        return {'code': 200, 'msg': 'uknown'};
      }
    }

    return {'code': 200, 'msg': 'uknown'};
  }

  authCheckHelper(Response response) {
    /// if [User] not_authenticated
    if (response.statusCode == 401) {
      return {'code': response.statusCode, 'msg': 'not_authenticated'};
    }

    /// if [User] not_authorized
    else if (response.statusCode == 403) {
      return {'code': response.statusCode, 'msg': 'not_authorized'};
    }

    /// if [Response] is_success
    else if (response.statusCode == 200) {
      var user = jsonDecode(response.body)['user'];

      /// if [Response_user] is_exist
      if (user != null) {
        return {'code': response.statusCode, 'msg': 'success'};
      } else {
        /// if [Response_user] is_not_exist

        return {'code': response.statusCode, 'msg': 'uknown'};
      }
    }

    return {'code': response.statusCode, 'msg': 'uknown'};
  }

  statusCodeValidation(Response response) {
    // authCheckHelper(response);

    /// if [User] not_authenticated
    if (response.statusCode == 401) {
      return {'code': response.statusCode, 'msg': 'not_authenticated'};
    }

    /// if [User] not_authorized
    else if (response.statusCode == 403) {
      return {'code': response.statusCode, 'msg': 'not_authorized'};
    }

    /// if [Response] is_success
    else if (response.statusCode == 200) {
      return {'code': response.statusCode, 'msg': 'success'};
    } else

    /// if [Response] code == 422
    if (response.statusCode == 422) {
      const snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('Yay! A SnackBar!'),
      );
      return snackbarKey.currentState?.showSnackBar(snackBar);
    } else {
      return {'code': response.statusCode, 'msg': 'uknown'};
    }
  }
}

class ApiHelpers {
  apiHeaders(String? token) {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      "content-type": "application/json",
    };
  }

  fileApiHeaders(String? token) {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      "Content-type": "multipart/form-data"
    };
  }
}
