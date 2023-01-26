import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_function/constants/base_url.dart';
import 'package:pocketbase_function/page/home_page.dart';

class LoginProvider extends ChangeNotifier {
  final pb = PocketBase(baseDB);

  //Getter and Setter
  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(value) => _isLoading = value;

  //Login Function
  userLogin(
      {required String username,
      required String password,
      required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    await pb
        .collection('users')
        .authWithPassword(username, password)
        .then((value) {
      if (pb.authStore.isValid == true) {
        print(pb.authStore.isValid);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      id: value.record!.id,
                    )));
      }
    }).catchError((error) {
      print(error);
    });
  }
}
