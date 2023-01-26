import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_function/constants/base_url.dart';
import 'package:pocketbase_function/model/user_model.dart';
import 'package:pocketbase_function/page/home_page.dart';

class LoginProvider extends ChangeNotifier {
  final pb = PocketBase(baseDB);
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
        print(pb.authStore.isValid);
        print(pb.authStore.token);
        print(pb.authStore.model.id);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      id: pb.authStore.model.id,
                    )),
            (route) => false);
      }
    }).catchError((error) {
      print(error);
    });
  }
}
