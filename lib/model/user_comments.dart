// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:pocketbase/pocketbase.dart';

part 'user_comments.g.dart';

@JsonSerializable()
class UserComment {
  String comments;
  String id;
  String postID;
  DateTime created;
  DateTime updated;
  String collectionId;
  String collectionName;
  UserComment({
    required this.comments,
    required this.id,
    required this.postID,
    required this.created,
    required this.updated,
    required this.collectionId,
    required this.collectionName,
  });

  /// Creates a new UserModel instance form the provided RecordModel.
  factory UserComment.fromRecord(RecordModel record) =>
      UserComment.fromJson(record.toJson());

  /// Connect the generated [_$UserModel] function to the `fromJson` factory.
  factory UserComment.fromJson(Map<String, dynamic> json) =>
      _$UserCommentFromJson(json);

  /// Connect the generated [_$UserModel] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserCommentToJson(this);
}
