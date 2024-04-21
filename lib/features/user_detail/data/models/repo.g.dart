// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) => Repo(
      name: json['name'] as String? ?? '',
      forks: json['forks'] as int? ?? 0,
      defaultBranch: json['default_branch'] as String? ?? '',
      description: json['description'] as String? ?? '',
      language: json['language'] as String? ?? '',
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'name': instance.name,
      'forks': instance.forks,
      'default_branch': instance.defaultBranch,
      'description': instance.description,
      'language': instance.language,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
