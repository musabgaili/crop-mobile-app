import 'dart:convert';
import 'dart:developer';

import 'package:cropsense/auth_screens/login_screen.dart';
import 'package:cropsense/helpers/auth_helper.dart';
import 'package:cropsense/helpers/shared_pref_helper.dart';
import 'package:cropsense/main.dart';
import 'package:cropsense/models/user.dart';
import 'package:cropsense/services/profile_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileNotifier extends ChangeNotifier {
  bool isRequesting = false;
  // Ref ref;
  AutoDisposeRef ref;
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  EditProfileNotifier(this.ref) {
    isRequesting = true;
    notifyListeners();
    getUser();
  }

  User? user;
  // Profile? profile;

  //
  //
  ProfileService profileService = ProfileService();
  SharedPreHelper sharedPreHelper = SharedPreHelper();
  final AuthHelper authHelper = AuthHelper();

  getUser() {
    // SharedPreHelper().getTeamAndUser().then((value) {
    //   user = User.fromJson(value['user']);
    //   phone.text = user!.name!;
    //   email.text = user!.email!;
    //   log("user Is ${user!.name}");
    //   // getUserData();
    // });

    isRequesting = false;
    notifyListeners();
  }

  updateData() {
    if (!profileFormKey.currentState!.validate()) {
      return;
    }
    var data = {'email': email.text, 'phone': phone.text};
    profileService.submitData(data).then((v) {
      // log('Updateed');
      // log(v.body);
      try {
        if (jsonDecode(v.body)['message'] == 'success') {
          snakBarT('updated');
        } else {
          snakBarT('error happened');
        }
      } catch (e) {
        snakBarT('error happened');
      }
    });
    // log(email.text);
  }

  snakBarT(String message, {color = Colors.green}) {
    var snackBar = SnackBar(
      backgroundColor: color,
      elevation: 1,
      padding: const EdgeInsets.all(20.0),
      content: Text(message),
    );
    return snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void logout() async {
    await sharedPreHelper.deleteUserToken().then((value) {
      log('message');
      navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    });

    // navigatorKey.currentState?.unti
  }
}

// final EditprofileNotifier = ChangeNotifierProvider.autoDispose<EditProfileNotifier>((ref) {
final editprofileNotifier =
    ChangeNotifierProvider.autoDispose<EditProfileNotifier>((ref) {
  return EditProfileNotifier(ref);
});
