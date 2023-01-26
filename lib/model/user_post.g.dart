// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPost _$UserPostFromJson(Map<String, dynamic> json) => UserPost(
      json['active'] as bool,
      json['author'] as String,
      json['category'] as String,
      json['collectionId'] as String,
      json['collectionName'] as String,
      DateTime.parse(json['created'] as String),
      json['description'] as String,
      json['id'] as String,
      (json['imagePath'] as List<dynamic>).map((e) => e as String).toList(),
      json['title'] as String,
      DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$UserPostToJson(UserPost instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'active': instance.active,
      'author': instance.author,
      'category': instance.category,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'title': instance.title,
    };
