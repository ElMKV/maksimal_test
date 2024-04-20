import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';


@JsonSerializable()
class Users {
  @JsonKey(name: 'total_count')
  final int totalCount;
  @JsonKey(name: 'items')
  final List<Items> items;



  const Users({
    this.totalCount = 0,
    this.items = const []

  });

  factory Users.fromJson(Map<String, dynamic> json) =>
      _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);

  Users copyWith({
    int? totalCount,
    List<Items>? items,
  }) {
    return Users(
      totalCount: totalCount ?? this.totalCount,
      items: items ?? this.items,

    );
  }
}

@JsonSerializable()
class Items {
  @JsonKey(name: 'login')
  final String login;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'followers_url')
  final String followersUrl;

  const Items({
    this.login = '',
    this.avatarUrl = '',
    this.followersUrl = '',

  });

  factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);

  Items copyWith({
    String? login,
    String? avatarUrl,
    String? followersUrl,
  }) {
    return Items(
      login: login ?? this.login,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      followersUrl: followersUrl ?? this.followersUrl,

    );
  }
}



