import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';


@JsonSerializable()
class Repo {
  @JsonKey(name: 'name')
  final String name;




  const Repo({
    this.name = '',

  });

  factory Repo.fromJson(Map<String, dynamic> json) =>
      _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);

  Repo copyWith({
    String? name,
  }) {
    return Repo(
      name: name ?? this.name,

    );
  }
}



