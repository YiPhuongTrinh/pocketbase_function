import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pocketbase/pocketbase.dart';

part 'user_post.g.dart';

@JsonSerializable()
class UserPost extends Equatable {
  String id;
  DateTime created;
  DateTime updated;
  String collectionId;
  String collectionName;
  bool active;
  String author;
  String category;
  String description;
  List<String> imagePath;
  String title;

  UserPost(
      this.active,
      this.author,
      this.category,
      this.collectionId,
      this.collectionName,
      this.created,
      this.description,
      this.id,
      this.imagePath,
      this.title,
      this.updated);

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory UserPost.fromJson(Map<String, dynamic> json) =>
      _$UserPostFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserPostToJson(this);

  factory UserPost.fromRecord(RecordModel record) =>
      UserPost.fromJson(record.toJson());

  @override
  List<Object?> get props => [
        id,
        created,
        updated,
        collectionId,
        collectionName,
        active,
        author,
        category,
        description,
        imagePath,
        title
      ];
}
