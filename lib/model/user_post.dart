import 'package:json_annotation/json_annotation.dart';
import 'package:pocketbase/pocketbase.dart';
part 'user_post.g.dart';

@JsonSerializable()
class UserPost {
  int? page;
  int? perPage;
  int? totalPages;
  int? totalItems;
  List<Items>? items;

  UserPost(
      {this.page, this.perPage, this.totalPages, this.totalItems, this.items});

  factory UserPost.fromRecord(RecordModel record) =>
      UserPost.fromJson(record.toJson());

  /// Connect the generated [_$UserPost] function to the `fromJson` factory.
  factory UserPost.fromJson(Map<String, dynamic> json) =>
      _$UserPostFromJson(json);

  /// Connect the generated [_$UserPost] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserPostToJson(this);
}

@JsonSerializable()
class Items {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? author;
  String? title;
  String? description;
  bool? active;
  List<String>? imagePath;
  String? category;

  Items(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.created,
      this.updated,
      this.author,
      this.title,
      this.description,
      this.active,
      this.imagePath,
      this.category});
  factory Items.fromRecord(RecordModel record) =>
      Items.fromJson(record.toJson());

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
