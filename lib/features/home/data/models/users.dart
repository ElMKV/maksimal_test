import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';


@JsonSerializable()
class Users {
  @JsonKey(name: 'total_count')
  final int totalCount;


  const Users({
    this.totalCount = 0,
  });

  factory Users.fromJson(Map<String, dynamic> json) =>
      _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);

  Users copyWith({
    int? totalCount,
  }) {
    return Users(
      totalCount: totalCount ?? this.totalCount,

    );
  }
}



