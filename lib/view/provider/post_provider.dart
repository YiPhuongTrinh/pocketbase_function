import 'package:flutter/material.dart';

import '../../model/user_post.dart';
import '../../model/user_repository.dart';

class PostProvider extends ChangeNotifier {
  final APILogin _services = APILogin();
  List<UserPost> userPost = [];

  bool _isLoading = false;
  get isLoading => _isLoading;

  Future<void> providerFetchPost() async {
    _isLoading = true;
    notifyListeners();

    final response = await _services.fetchAll();

    userPost = response;
    _isLoading = false;
    notifyListeners();
  }
}
