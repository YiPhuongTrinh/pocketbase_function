import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_function/model/user_data.dart';
import 'package:pocketbase_function/model/user_post.dart';

import '../constants/base_url.dart';

final pb = PocketBase(baseDB);

class APILogin {
  late UserData model;
  Future<UserData> fetchData(String id) async {
    final record = await pb.collection('users').getOne(id).then((value) {
      print(value);
      return UserData.fromRecord(value);
    }).catchError((onError) {
      return print(onError);
    });
    return record;
  }

  List<UserPost> userPost = [];

  Future<List<UserPost>> fetchAll() async {
    await pb.collection('posts').getList().then((value) {
      try {
        for (var element in value.items) {
          userPost.add(UserPost.fromJson(jsonDecode(element.toString())));
        }
        print(userPost);
      } catch (e) {
        print(e);
      }
    });
    return userPost;
  }
}
