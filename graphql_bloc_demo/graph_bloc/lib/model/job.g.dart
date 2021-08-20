// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    id: json['id'] as String,
    title: json['title'] as String,
    applyUrl: json['applyUrl'] as String,
    locationNames: json['locationNames'] as String,
    userEmail: json['userEmail'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    description: json['description'] as String,
    isPublished: json['isPublished'] as bool,
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'applyUrl': instance.applyUrl,
      'locationNames': instance.locationNames,
      'userEmail': instance.userEmail,
      'createdAt': instance.createdAt?.toIso8601String(),
      'description': instance.description,
      'isPublished': instance.isPublished,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
