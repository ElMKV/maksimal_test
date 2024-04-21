import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';


@JsonSerializable()
class Repo {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'forks')
  final int forks;
  @JsonKey(name: 'default_branch')
  final String defaultBranch;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'language')
  final String language;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;




  const Repo({
    this.name = '',
    this.forks = 0,
    this.defaultBranch = '',
    this.description = '',
    this.language = '',
    this.updatedAt,


  });

  factory Repo.fromJson(Map<String, dynamic> json) =>
      _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);

  Repo copyWith({
    String? name,
    int? forks,
    String? defaultBranch,
    String? description,
    String? language,
    DateTime? updatedAt
  }) {
    return Repo(
      name: name ?? this.name,
      forks: forks ?? this.forks,
      defaultBranch: defaultBranch ?? this.defaultBranch,
      description: description ?? this.description,
      language: language ?? this.language,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}



