// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_function/constants/base_url.dart';
import 'package:pocketbase_function/model/user_model.dart';
import 'package:pocketbase_function/page/home_page.dart';

class LoginProvider extends ChangeNotifier {
  final pb = PocketBase(baseDB);
  String? _name;
  get name => _name;
  set name(value) => _name = value;

  bool _isValid = false;
  get isValid => _isValid;
  set isValid(value) => _isValid = value;

  String? modelId;
  String? model2;
  late UserModel _userModel;
  get userModel => _userModel;
  set userModel(value) => _userModel = value;

  //Login Function
  userLogin(
      {required String username,
      required String password,
      required BuildContext context}) async {
    await pb
        .collection('users')
        .authWithPassword(username, password)
        .then((value) {
      if (pb.authStore.isValid == true) {
        _isValid = true;
        notifyListeners();
        print(pb.authStore.isValid);
        print(pb.authStore.token);
        print(pb.authStore.model.id);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      id: pb.authStore.model.id,
                    )));
      }
    }).catchError((error) {
      print(error);
    });
  }

  userLogout() {
    pb.authStore.clear();
    _isValid = false;
    notifyListeners();
  }
}
