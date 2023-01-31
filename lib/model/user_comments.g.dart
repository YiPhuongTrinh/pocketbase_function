// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserComment _$UserCommentFromJson(Map<String, dynamic> json) => UserComment(
      comments: json['comments'] as String,
      id: json['id'] as String,
      postID: json['postID'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
    );

Map<String, dynamic> _$UserCommentToJson(UserComment instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'id': instance.id,
      'postID': instance.postID,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
    };
