
import 'package:cropsense/helpers/auth_helper.dart';
import 'package:cropsense/helpers/shared_pref_helper.dart';
import 'package:cropsense/services/profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditPasswordNotifier extends ChangeNotifier {
  bool isRequesting = false;
  Ref ref;
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  EditPasswordNotifier(this.ref) {
    // isRequesting = true;
    // notifyListeners();
    // getUser();
  }

  //
  ProfileService profileService = ProfileService();
  SharedPreHelper sharedPreHelper = SharedPreHelper();
  final AuthHelper authHelper = AuthHelper();

  getUser() {}

  updateData() {
    if (!profileFormKey.currentState!.validate()) {
      return;
    }
    var data = {'password': password.text, 'newPassword': newPassword.text};
    profileService.updatePassword(data).then((v) {
    });
  }
}

// final EditPasswordNotifier = ChangeNotifierProvider.autoDispose<EditPasswordNotifier>((ref) {
final editPasswordNotifier =
    ChangeNotifierProvider.autoDispose<EditPasswordNotifier>((ref) {
  return EditPasswordNotifier(ref);
});
