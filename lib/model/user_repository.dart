import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_function/model/user_comments.dart';
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
    await pb.collection('posts').getList(sort: '-created').then((value) {
      try {
        // userPost
        //     .addAll(value.items.map((e) => UserPost.fromRecord(e)).toList());
        for (var element in value.items) {
          // print(element.id);
          //NOTE -  Chỗ này để remove không bị duplicate khi fetch dữ liệu
          userPost.removeWhere((e) => element.id == e.id);
          userPost.add(UserPost.fromJson(jsonDecode(element.toString())));
        }
        // print(userPost);
      } catch (e) {
        // print(e);
      }
    });
    return userPost;
  }

  Future<UserPost> getUserPost(String id) async {
    final record = await pb
        .collection('posts')
        .getOne(id)
        .then((value) => UserPost.fromRecord(value));
    return record;
  }

  List<UserComment> userComment = [];
  Future<List<UserComment>> fetchUserComment(String postId) async {
    await pb
        .collection('comments')
        .getList(
          // filter: "postID.id='$postId'",
          filter: "postID.id='$postId'",
        )
        .then((value) => value.items.forEach((element) {
              userComment
                  .add(UserComment.fromJson(jsonDecode(element.toString())));
            }))
        .catchError((onError) => print(onError));
    return userComment;
  }
}
