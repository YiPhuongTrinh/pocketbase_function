import 'package:flutter/material.dart';
import 'package:pocketbase_function/model/user_comments.dart';

import '../../model/user_post.dart';
import '../../model/user_repository.dart';

class PostProvider extends ChangeNotifier {
  final APILogin _services = APILogin();
  List<UserPost> _userPost = [];

  get userPost => _userPost;

  set userPost(value) => _userPost = value;
  bool _isLoading = false;
  get isLoading => _isLoading;

  Future<void> providerFetchPost() async {
    _isLoading = true;
    notifyListeners();

    final response = await _services.fetchAll();

    _userPost = response;
    _isLoading = false;
    notifyListeners();
  }
}

class SinglePostProvider extends ChangeNotifier {
  final APILogin _services = APILogin();
  UserPost? singleUserPost;
  List<UserComment> userComment = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> providerSingleFetchPost(String id) async {
    _isLoading = true;
    notifyListeners();

    final response = await _services.getUserPost(id);
    singleUserPost = response;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> providerAllCommentPost(String postId) async {
    _isLoading = true;
    notifyListeners();

    final Response = await _services.fetchUserComment(postId);
    userComment = Response;

    _isLoading = false;
    notifyListeners();
  }
}
