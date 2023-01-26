// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:pocketbase/pocketbase.dart";
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id, username;
  final String? name, avatar;
  UserModel({
    required this.id,
    this.name,
    required this.username,
    this.avatar,
  });

  /// Creates a new UserModel instance form the provided RecordModel.
  factory UserModel.fromRecord(RecordModel record) =>
      UserModel.fromJson(record.toJson());

  /// Connect the generated [_$UserModel] function to the `fromJson` factory.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Connect the generated [_$UserModel] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
