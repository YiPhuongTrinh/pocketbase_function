// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:pocketbase/pocketbase.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  String id;
  String collectionId;
  String collectionName;
  String avatar;
  String name;
  String username;
  DateTime created;
  DateTime updated;
  UserData({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.avatar,
    required this.name,
    required this.username,
    required this.created,
    required this.updated,
  });

  /// Creates a new UserModel instance form the provided RecordModel.
  factory UserData.fromRecord(RecordModel record) =>
      UserData.fromJson(record.toJson());

  /// Connect the generated [_$UserModel] function to the `fromJson` factory.
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  /// Connect the generated [_$UserModel] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
