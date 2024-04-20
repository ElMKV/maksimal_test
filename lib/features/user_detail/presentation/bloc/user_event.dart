part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}


class GetDetailUser extends UserEvent {
  final String login;
  GetDetailUser(this.login);
}